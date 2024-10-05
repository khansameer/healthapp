import 'package:flutter/material.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/route/route_generator.dart';
import 'package:junohealthapp/provider/chat_provider.dart';
import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:junohealthapp/provider/doctor_provider.dart';
import 'package:junohealthapp/provider/health_goal_provider.dart';
import 'package:junohealthapp/provider/interaction_provider.dart';
import 'package:junohealthapp/provider/medicine_provider.dart';
import 'package:junohealthapp/provider/quiz_provider.dart';
import 'package:junohealthapp/provider/symptoms_cheeker_provider.dart';
import 'package:junohealthapp/shared_preferences/preference_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
  ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
  ChangeNotifierProvider<ChatProvider>(create: (_) => ChatProvider()),
  ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
  ChangeNotifierProvider<HealthGoalProvider>(
      create: (_) => HealthGoalProvider()),
  ChangeNotifierProvider<MedicineProvider>(create: (_) => MedicineProvider()),
  ChangeNotifierProvider<SymptomsCheekerProvider>(
      create: (_) => SymptomsCheekerProvider()),
  ChangeNotifierProvider<DoctorProvider>(create: (_) => DoctorProvider()),
  ChangeNotifierProvider<InteractionProvider>(
      create: (_) => InteractionProvider()),
];
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceHelper.load().then((value) {});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: "appName",
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child ?? const SizedBox.shrink(),
          );
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
      ),
    );
  }
}
