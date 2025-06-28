import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/logic/auth/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (user) {
            context.go('/');
          },
          notLoggedIn: (user) {
            context.go('/login');
          },
          error: (message, user) {},
          loading: (user) {},
        );
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/logo.png'),
                ),
                const Spacer(),
                const Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: 'Cargando...',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
