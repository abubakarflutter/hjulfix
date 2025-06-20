import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hjulfix_new/features/shared/auth/views/login_view.dart';
import 'package:hjulfix_new/features/shared/welcome/views/welcome_view.dart';
import 'routes.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.welcome,
  routes: [
    GoRoute(
      path: RoutePaths.welcome,
      name: Routes.welcome,
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
      path: RoutePaths.login,
      name: Routes.login,
      builder: (context, state) => const LoginView(),
    ),
  ],
);