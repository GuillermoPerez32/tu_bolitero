import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up_outlined),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad_outlined),
          label: ' ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: ' ',
        ),
      ],
      currentIndex: index,
      onTap: (i) {
        final location = GoRouterState.of(context).uri.toString();
        switch (i) {
          case 0:
            if (location == '/') return;
            context.replace('/');
            break;
          case 1:
            if (location == '/algorithms') return;
            context.replace('/algorithms');
            break;
          case 2:
            if (location == '/info') return;
            context.replace('/info');
            break;
          case 3:
            if (location == '/profile') return;
            context.replace('/profile');
            break;
        }
      },
    );
  }
}
