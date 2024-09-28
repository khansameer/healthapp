import 'package:flutter/material.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_opt_view.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_screen.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';
import 'package:junohealthapp/screen/authentication/signup/signup_screen.dart';
import 'package:junohealthapp/screen/dashboard/dashboard_screen.dart';
import 'package:junohealthapp/screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
            settings: const RouteSettings(name: RouteName.splashScreen));
      case RouteName.login:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
            settings: const RouteSettings(name: RouteName.login));
      case RouteName.forgotPasswordOptView:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordOptView(),
            settings:
                const RouteSettings(name: RouteName.forgotPasswordOptView));
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => const ForgotScreen(),
            settings:
                const RouteSettings(name: RouteName.forgotPasswordScreen));

      case RouteName.dashboard:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
            settings: const RouteSettings(name: RouteName.dashboard));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
