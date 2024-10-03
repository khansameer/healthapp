import 'package:flutter/material.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/demo_screen.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_opt_view.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_reset_view.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_screen.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';
import 'package:junohealthapp/screen/chat_screen/chat_screen.dart';

import 'package:junohealthapp/screen/dashboard/dashboard_screen.dart';
import 'package:junohealthapp/screen/doctor/doctor_list_screen.dart';
import 'package:junohealthapp/screen/health_goal/health_goal_view.dart';
import 'package:junohealthapp/screen/interaction_check/interaction_check_phase_one_screen.dart';
import 'package:junohealthapp/screen/interaction_check/interaction_check_screen.dart';
import 'package:junohealthapp/screen/medicine_reminder/add_reminder_screen.dart';
import 'package:junohealthapp/screen/medicine_reminder/medicine_reminder_view.dart';
import 'package:junohealthapp/screen/notification/notification_screen.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_result_screen.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_view_screen.dart';
import 'package:junohealthapp/screen/splash_screen.dart';
import 'package:junohealthapp/screen/symptom_checker/symptom_checker_view.dart';
import 'package:junohealthapp/screen/symptom_checker/symptoms_checker_view_details.dart';
import 'package:junohealthapp/screen/symptom_checker/symptoms_view_one.dart';
import 'package:junohealthapp/screen/symptom_checker/symptoms_view_three.dart';
import 'package:junohealthapp/screen/symptom_checker/symptoms_view_two.dart';
import 'package:junohealthapp/screen/tops_news/top_news_details.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
            settings: const RouteSettings(name: RouteName.splashScreen));
      case RouteName.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
            settings: const RouteSettings(name: RouteName.loginScreen));
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
      case RouteName.dashboardScreen:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
            settings: const RouteSettings(name: RouteName.dashboardScreen));

      case RouteName.notificationScreen:
        return MaterialPageRoute(
            builder: (_) => const NotificationScreen(),
            settings: const RouteSettings(name: RouteName.notificationScreen));

      case RouteName.chatScreen:
        final args = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  isAI: args,
                ),
            settings: const RouteSettings(name: RouteName.chatScreen));

      case RouteName.topNewsDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const TopNewsDetails(),
            settings:
                const RouteSettings(name: RouteName.topNewsDetailsScreen));

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

      case RouteName.healthGoalScreen:
        return MaterialPageRoute(
            builder: (_) => const HealthGoalView(),
            settings: const RouteSettings(name: RouteName.healthGoalScreen));

      case RouteName.medicineReminderView:
        return MaterialPageRoute(
            builder: (_) => const MedicineReminderView(),
            settings:
                const RouteSettings(name: RouteName.medicineReminderView));

      case RouteName.addReminderScreen:
        return MaterialPageRoute(
            builder: (_) => const AddReminderScreen(),
            settings: const RouteSettings(name: RouteName.addReminderScreen));

      case RouteName.symptomCheckerScreen:
        return MaterialPageRoute(
            builder: (_) => const SymptomCheckerView(),
            settings:
                const RouteSettings(name: RouteName.symptomCheckerScreen));

      case RouteName.symptomsCheckerViewDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const SymptomsCheckerViewDetails(),
            settings: const RouteSettings(
                name: RouteName.symptomsCheckerViewDetailsScreen));
      case RouteName.symptomsViewOneScreen:
        return MaterialPageRoute(
            builder: (_) => const SymptomsViewOne(),
            settings:
                const RouteSettings(name: RouteName.symptomsViewOneScreen));

      case RouteName.symptomsViewTwoScreen:
        return MaterialPageRoute(
            builder: (_) => const SymptomsViewTwo(),
            settings:
                const RouteSettings(name: RouteName.symptomsViewTwoScreen));

      case RouteName.symptomsViewThreeScreen:
        return MaterialPageRoute(
            builder: (_) => const SymptomsViewThree(),
            settings:
                const RouteSettings(name: RouteName.symptomsViewThreeScreen));

      case RouteName.doctorListScreen:
        return MaterialPageRoute(
            builder: (_) => const DoctorListScreen(),
            settings: const RouteSettings(name: RouteName.doctorListScreen));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
