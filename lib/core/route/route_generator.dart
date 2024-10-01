import 'package:flutter/material.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/demo_screen.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_opt_view.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_reset_view.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_screen.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';
import 'package:junohealthapp/screen/chat_screen/chat_screen.dart';

import 'package:junohealthapp/screen/dashboard/dashboard_screen.dart';
import 'package:junohealthapp/screen/interaction_check/interaction_check_phase_one_screen.dart';
import 'package:junohealthapp/screen/interaction_check/interaction_check_screen.dart';
import 'package:junohealthapp/screen/notification/notification_screen.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_result_screen.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_view_screen.dart';
import 'package:junohealthapp/screen/splash_screen.dart';
import 'package:junohealthapp/screen/tops_news/top_news_details.dart';

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
      case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => const ForgotScreen(),
            settings:
                const RouteSettings(name: RouteName.forgotPasswordScreen));
      case RouteName.forgotPasswordOptView:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordOptView(),
            settings:
                const RouteSettings(name: RouteName.forgotPasswordOptView));

      case RouteName.forgotPasswordResetView:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordResetView(),
            settings:
                const RouteSettings(name: RouteName.forgotPasswordResetView));
      case RouteName.dashboard:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
            settings: const RouteSettings(name: RouteName.dashboard));

      case RouteName.notification:
        return MaterialPageRoute(
            builder: (_) => const NotificationScreen(),
            settings: const RouteSettings(name: RouteName.notification));

      case RouteName.chatScreen:
        return MaterialPageRoute(
            builder: (_) => const ChatScreen(),
            settings: const RouteSettings(name: RouteName.chatScreen));

      case RouteName.topNewsDetails:
        return MaterialPageRoute(
            builder: (_) => const TopNewsDetails(),
            settings: const RouteSettings(name: RouteName.topNewsDetails));

      case RouteName.quizViewScreen:
        return MaterialPageRoute(
            builder: (_) => const QuizViewScreen(),
            settings: const RouteSettings(name: RouteName.quizViewScreen));

      case RouteName.quizResultScreen:
        return MaterialPageRoute(
            builder: (_) => const QuizResultScreen(),
            settings: const RouteSettings(name: RouteName.quizResultScreen));

      case RouteName.interactionCheckScreen:
        return MaterialPageRoute(
            builder: (_) => const InteractionCheckScreen(),
            settings:
                const RouteSettings(name: RouteName.interactionCheckScreen));

      case RouteName.interactionCheckPhaseOneScreen:
        return MaterialPageRoute(
            builder: (_) => const InteractionCheckPhaseOneScreen(),
            settings: const RouteSettings(
                name: RouteName.interactionCheckPhaseOneScreen));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
