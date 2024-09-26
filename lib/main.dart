import 'package:flchart/views/chartscreen.dart';
import 'package:flchart/views/homescreen.dart';
import 'package:flchart/views/sikhoKamaoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
void main() {
  runApp(
      ProviderScope(
          child: const MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(

      //current root is '/'
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),//default route
        GoRoute(path: '/chart', builder: (context, state) =>ChartScreen()),
        GoRoute(path: '/sikhokamao',builder:(context,state)=>SikhoKamaoScreen())
      ],
    );


    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,//router object me sare routes defined hai
    );
  }
}

