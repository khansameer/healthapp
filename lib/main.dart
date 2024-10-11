import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/route/route_generator.dart';
import 'package:junohealthapp/core/video_auth.dart';
import 'package:junohealthapp/firebase/firebase_service.dart';
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
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'core/firebase/firebase_options.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print("Handling a background message: ${message.messageId}");
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
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
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  PreferenceHelper.load().then((value) {});
  await FirebaseService.setupFirebase();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    getToken();
    // Handle messages when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('===========$message');
      if (message.data['call'] == 'start') {
        _startVideoCall();
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      print('===========$message');
      if (message != null && message.data['call'] == 'start') {
        _startVideoCall();
      }
    });
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('==getToken==== $token');
  }

  void _startVideoCall() {
    // Navigate to the video call screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ZegoUIKitPrebuiltCall(
          appID: VideoAuth.appID,
          appSign: VideoAuth.appSign,
          userID: "abc",
          userName:"Sameer",
          callID: "sameer",
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: MyApp.navigatorKey,
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
