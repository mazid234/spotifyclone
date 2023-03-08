import 'package:flutter/material.dart';
import 'package:spotify/Screens/StartPage.dart';
import 'package:spotify/Screens/homepage.dart';
import 'package:spotify/Screens/login.dart';
import 'package:spotify/Screens/signup1.dart';
import 'package:spotify/Utils/route_name.dart';
import 'package:spotify/widgetTree.dart';

class Routes {
  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.signupScreen:
        return MaterialPageRoute(
          builder: (context) => SignupScreen(),
        );
      case RouteName.startScreen:
        return MaterialPageRoute(
          builder: (context) => const StartPage(),
        );
      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RouteName.homepage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case RouteName.widgetTree:
        return MaterialPageRoute(
          builder: (context) => const WidgetTree(),
        );
    }
  }
}
