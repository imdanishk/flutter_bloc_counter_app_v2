import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter_app_v2/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_counter_app_v2/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_counter_app_v2/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
            // key: GlobalKey<ScaffoldMessengerState>(), // New Key for HomeScreen
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
            homeScreenKey: settings.arguments as GlobalKey<ScaffoldMessengerState>,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: "Third Screen",
            color: Colors.greenAccent,
            // key: GlobalKey<ScaffoldMessengerState>(), // New Key for ThirdScreen
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
