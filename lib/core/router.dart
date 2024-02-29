import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/screens/HomeScreen.dart';
import 'package:tu_bolitero/ui/screens/ResultsScreen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'results',
          builder: (BuildContext context, GoRouterState state) {
            return const ResultsScreen();
          },
        ),
      ],
    ),
  ],
);
