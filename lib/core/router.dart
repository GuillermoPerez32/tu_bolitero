import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/screens/result_detail_screen.dart';
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
            routes: [
              GoRoute(
                path: ':id',
                builder: (BuildContext context, GoRouterState state) {
                  return ResultDetailScreen(
                    lotteryId: state.pathParameters['id'],
                  );
                },
              )
            ],
          ),
          GoRoute(
            path: 'atrasados',
            builder: (BuildContext context, GoRouterState state) {
              return const AtrasadosScreen();
            },
          ),
          GoRoute(
            path: 'algoritmos',
            builder: (BuildContext context, GoRouterState state) {
              return const AlgoritmosScreen();
            },
          ),
          GoRoute(
            path: 'charada',
            builder: (BuildContext context, GoRouterState state) {
              return const CharadaScreen();
            },
          ),
        ]),
  ],
);
