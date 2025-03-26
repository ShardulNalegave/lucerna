import 'package:go_router/go_router.dart';
import 'package:lucerna/views/home.dart';
import 'package:lucerna/views/new_paper.dart';
import 'package:lucerna/views/paper.dart';
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
    GoRoute(
      path: '/paper',
      pageBuilder:
          (context, state) =>
              NoTransitionPage(key: state.pageKey, child: PaperView()),
    ),
    GoRoute(
      path: '/paper/new',
      pageBuilder:
          (context, state) =>
              NoTransitionPage(key: state.pageKey, child: NewPaperView()),
    ),
  ],
);
