//TODO generate Application routes
import 'package:client/Presentation/screen/SignupScreen.dart';
import 'package:client/Presentation/screen/SplashScreen.dart';
import 'package:client/Presentation/screen/loginScreen.dart';
import 'package:client/Presentation/screen/todoScreen.dart';
import 'package:flutter/material.dart';

class ApplicationRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case TodoSplashScreen.ScreenRoute:
        return MaterialPageRoute(
          builder: (context) => TodoSplashScreen(),
        );
        break;
      case TodoSignupScreen.PageRoute:
        return MaterialPageRoute(
          builder: (context) => TodoSignupScreen(),
        );
      case TodoLoginScreen.PageRoute:
        return MaterialPageRoute(
          builder: (context) => TodoLoginScreen(),
        );
        break;
      case TodoDataScreen.ScreenRoute:
        return MaterialPageRoute(
          builder: (context) => TodoDataScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => TodoSplashScreen(),
        );
        break;
    }
  }
}
