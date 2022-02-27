import 'package:flutter/material.dart';
import 'package:pagination/core/constants/exports.dart';

class AppRouter {
  static generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/view':
        return MaterialPageRoute(
          builder: (context) => const HomeViewPage(),
        );
    }
  }
}
