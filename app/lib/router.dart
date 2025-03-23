import 'package:go_router/go_router.dart';
import 'package:lucerna/views/home.dart';
import 'package:lucerna/views/results.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) =>
              NoTransitionPage(key: state.pageKey, child: HomeView()),
    ),
    GoRoute(
      path: '/results',
      pageBuilder:
          (context, state) =>
              NoTransitionPage(key: state.pageKey, child: ResultsView()),
    ),
  ],
);
