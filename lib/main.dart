import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/pages/calendar.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/todo_item_form.dart';
import 'package:todo_app/widgets/base_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  initialLocation: Home.routeName,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BaseScaffold(body: child),
      routes: [
        GoRoute(
          name: Home.routeName,
          path: Home.routeName,
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          name: Calendar.routeName,
          path: Calendar.routeName,
          builder: (context, state) => const Calendar(),
        ),
      ],
    ),
    GoRoute(
      name: TodoItemForm.routeName,
      path: TodoItemForm.routeName,
      builder: (context, state) => const TodoItemForm(),
    ),
  ],
);
