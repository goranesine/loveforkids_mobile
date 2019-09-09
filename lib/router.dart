import 'package:flutter/material.dart';
import 'package:loveforkids/src/ui/screen/home/home_screen.dart';
import 'package:loveforkids/src/ui/screen/splash/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(SplashScreenViewModel()));
      case RouteName.home:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(HomeScreenViewModel()));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class RouteName {
  static const String splash = 'splash/';
  static const String home = '/';
}