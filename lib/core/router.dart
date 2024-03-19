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
            routes: [
              GoRoute(
                path: ':id',
                builder: (BuildContext context, GoRouterState state) {
                  return AtrasoDetailScreen(
                    lotteryId: state.pathParameters['id'],
                  );
                },
              )
            ],
          ),
          GoRoute(
              path: 'algoritmos',
              builder: (BuildContext context, GoRouterState state) {
                return const AlgoritmosScreen();
              },
              routes: [
                GoRoute(
                  path: 'piramide',
                  builder: (BuildContext context, GoRouterState state) {
                    return const PiramideScreen();
                  },
                ),
                GoRoute(
                  path: 'cruz_suerte',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CruzSuerteScreen();
                  },
                ),
                GoRoute(
                  path: 'numero_suerte',
                  builder: (BuildContext context, GoRouterState state) {
                    return const NumeroSuerteScreen();
                  },
                ),
                GoRoute(
                  path: 'table',
                  builder: (BuildContext context, GoRouterState state) {
                    return const TablaDiosesScreen();
                  },
                ),
              ]),
          GoRoute(
              path: 'charada',
              builder: (BuildContext context, GoRouterState state) {
                return const CharadaScreen();
              },
              routes: [
                GoRoute(
                  path: 'clasica',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CharadaClasicaScreen();
                  },
                ),
                GoRoute(
                  path: 'mixta',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CharadaMixtaScreen();
                  },
                ),
              ]),
        ]),
  ],
);
