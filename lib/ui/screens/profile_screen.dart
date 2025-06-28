import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  final TextEditingController _phone = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          notLoggedIn: () {
            context.go('/login');
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
                              child: userData.user.photo != null &&
                                      userData.user.photo!.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        userData.user.photo!,
                                      ),
                                    )
                                  : const CircleAvatar(
                                      radius: 30,
                                      child: Icon(
                                        Icons.person,
                                        size: 32,
                                      ),
                                    ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: FilledButton(
                                onPressed: () {},
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.all(6),
                                  shape: const CircleBorder(),
                                  minimumSize: const Size(26, 26),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                child: const Icon(Icons.edit, size: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(userData.user.username),
                        const SizedBox(height: 10),
                        Text(userData.user.email),
                        const SizedBox(height: 20),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nombre de usuario',
                          ),
                          controller: TextEditingController(
                            text: userData.user.username,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          controller: TextEditingController(
                            text: userData.user.email,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            authCubit.logout();
                          },
                          child: const Text('Cerrar Sesión'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FilledButton(
                            onPressed: () {
                              authCubit.logout();
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Guardar Cambios',
                                textAlign: TextAlign.center,
                              ),
                            ),
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
