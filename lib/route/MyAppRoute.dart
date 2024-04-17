import 'package:employee/features/home/screens/home_screen.dart';
import 'package:employee/route/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouterConstants.home,
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
      ),
    ],
  );
}
