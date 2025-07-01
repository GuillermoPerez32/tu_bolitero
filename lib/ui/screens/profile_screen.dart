import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tu_bolitero/ui/logic/auth/auth_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bolitero_app_bar.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  File? _pickedImage;
  bool _isLoading = false;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveChanges() async {
    if (_username.text.isEmpty && _email.text.isEmpty && _pickedImage == null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final authCubit = context.read<AuthCubit>();
      await authCubit.updateProfile(
        username: _username.text.isNotEmpty ? _username.text : null,
        email: _email.text.isNotEmpty ? _email.text : null,
        photo: _pickedImage,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil actualizado correctamente')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar el perfil: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (message, user) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Error al actualizar el perfil: $message')),
            );
          },
          success: (user) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Perfil actualizado correctamente')),
            );
          },
        );
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const BoliteroAppBar(
              title: Text('Perfil'),
              actions: [],
            ),
            bottomNavigationBar: const BottomBar(index: 3),
            body: state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: (user) => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (userData) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: _pickedImage != null
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: FileImage(_pickedImage!),
                                    )
                                  : userData.photo != null &&
                                          userData.photo!.isNotEmpty
                                      ? CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                            userData.photo!,
                                          ),
                                        )
                                      : const CircleAvatar(
                                          radius: 30,
                                          child: Icon(
                                            Icons.person_rounded,
                                            size: 32,
                                          ),
                                        ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: FilledButton(
                                onPressed: _pickImage,
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.all(6),
                                  shape: const CircleBorder(),
                                  minimumSize: const Size(26, 26),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                child: const Icon(Icons.edit_rounded, size: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(userData.username),
                        const SizedBox(height: 10),
                        Text(userData.email),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nombre de usuario',
                          ),
                          controller: _username..text = userData.username,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          controller: _email..text = userData.email,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            authCubit.logout();
                            context.go('/login');
                          },
                          child: const Text('Cerrar Sesión'),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _saveChanges,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Guardar Cambios'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
