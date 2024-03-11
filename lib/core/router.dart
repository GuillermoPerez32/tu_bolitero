import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/screens/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: 'results',
            builder: (BuildContext context, GoRouterState state) {
              return const ResultsScreen();
            },
          ),
          GoRoute(
            path: 'atrasados',
            builder: (BuildContext context, GoRouterState state) {
              return AtrasadosScreen();
            },
          ),
          GoRoute(
            path: 'algoritmos',
            builder: (BuildContext context, GoRouterState state) {
              return AlgoritmosScreen();
            },
          ),
          GoRoute(
            path: 'charada',
            builder: (BuildContext context, GoRouterState state) {
              return CharadaScreen();
            },
          ),
        ]),
  ],
);
