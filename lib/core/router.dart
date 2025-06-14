import 'package:go_router/go_router.dart';
import 'package:tu_bolitero/ui/screens/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    // ─────────────────────── AUTH ───────────────────────
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    // ─────────────────────── HOME ────── ─────────────────
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'posts/:id/comments',
          builder: (context, state) => CommentsScreen(
            postId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: 'piramide',
          builder: (context, state) => LotteriesListScreen(
            onLotterySelected: (lotteryId) {
              context.go('piramide/$lotteryId');
            },
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => PiramideScreen(
                lotteryId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'cruz_suerte',
          builder: (context, state) => LotteriesListScreen(
            onLotterySelected: (lotteryId) {
              context.go('cruz_suerte/$lotteryId');
            },
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => CruzSuerteScreen(
                lotteryId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'table',
          builder: (context, state) => LotteriesListScreen(
            onLotterySelected: (lotteryId) {
              context.go('table/$lotteryId');
            },
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => TablaDiosesScreen(
                lotteryId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'results',
          builder: (context, state) => LotteriesListScreen(
            onLotterySelected: (lotteryId) {
              context.go('results/$lotteryId');
            },
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => ResultsScreen(
                lotteryId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'atrasados',
          builder: (context, state) => LotteriesListScreen(
            onLotterySelected: (lotteryId) {
              context.go('atrasados/$lotteryId');
            },
          ),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) => AtrasadosScreen(
                lotteryId: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'algorithms',
          builder: (context, state) => const AlgorithmsScreen(),
        ),
        GoRoute(
          path: 'charada',
          builder: (context, state) => const CharadaClasicaScreen(),
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
