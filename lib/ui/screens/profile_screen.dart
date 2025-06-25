import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/logic/auth/auth_cubit.dart';
import 'package:tu_bolitero/ui/widgets/bottom_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        bottomNavigationBar: const BottomBar(index: 3),
        body: Center(
          child: FilledButton(
            onPressed: () {
              authCubit.logout();
            },
            child: const Text('Cerrar Sesión'),
          ),
        ),
      ),
    );
  }
}
