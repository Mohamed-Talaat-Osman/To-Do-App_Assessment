import 'package:basic_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:basic_flutter_structure/presentation/screens/home/newTask_screen.dart';
import 'package:flutter/material.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/NewTask':
        return MaterialPageRoute(builder: (_) => NewTaskScreen());
      default:
        return null;
    }
  }
}