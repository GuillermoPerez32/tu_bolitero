import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/core/constants.dart';
import 'package:tu_bolitero/ui/logic/auth/auth_cubit.dart';

class BoliteroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BoliteroAppBar({super.key, this.title, this.actions});

  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AppBar(
          title: title ?? const Text(appTitle),
          actions: actions ??
              [
                state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (userData) => GestureDetector(
                    onTap: () {
                      context.replace('/profile');
                    },
                    child: CircleAvatar(
                      backgroundImage: userData.photo != null
                          ? NetworkImage(userData.photo!)
                          : null,
                      child: const Icon(
                        Icons.person,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
