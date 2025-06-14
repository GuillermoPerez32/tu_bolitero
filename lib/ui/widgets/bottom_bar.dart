import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        if (i == index) return;
        switch (i) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/algorithms');
            break;
          case 2:
            context.go('/results');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
    );
  }
}
