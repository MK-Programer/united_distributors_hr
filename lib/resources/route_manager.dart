import 'package:flutter/material.dart';
import '../screens/auth/forget_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/children_widget.dart';
import '../screens/home/home_screen.dart';
import 'string_manager.dart';

class Routes {
  static const String loginRoute = '/Login';
  static const String forgetPasswordRoute = '/ForgetPassword';
  static const String homeRoute = '/Home';
  static const String childrenRoute = '/Children';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.childrenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChildrenWidget(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            AppString.noRouteFound,
          ),
        ),
      ),
    );
  }
}
