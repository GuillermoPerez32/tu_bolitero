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
          path: 'info',
          builder: (context, state) => const InfoScreen(),
          routes: [
            GoRoute(
              path: 'results',
              builder: (context, state) => LotteriesListScreen(
                onLotterySelected: (lotteryId) {
                  context.go('/info/results/$lotteryId');
                },
                selectedIndex: 2,
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) => ResultDetailScreen(
                    lotteryId: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'charada',
              builder: (context, state) => CharadaClasicaScreen(),
            ),
            GoRoute(
              path: 'atrasados',
              builder: (context, state) => LotteriesListScreen(
                onLotterySelected: (lotteryId) {
                  context.go('/info/atrasados/$lotteryId');
                },
                selectedIndex: 2,
              ),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) => AtrasoDetailScreen(
                    lotteryId: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'algorithms',
          builder: (context, state) => const AlgorithmsScreen(),
          routes: [
            GoRoute(
              path: 'piramide',
              builder: (context, state) => LotteriesListScreen(
                onLotterySelected: (lotteryId) {
                  context.go('/algorithms/piramide/$lotteryId');
                },
                selectedIndex: 1,
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
                  context.go('/algorithms/cruz_suerte/$lotteryId');
                },
                selectedIndex: 1,
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
                  context.go('/algorithms/table/$lotteryId');
                },
                selectedIndex: 1,
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
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
