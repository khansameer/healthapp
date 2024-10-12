import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
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
import 'package:junohealthapp/screen/video_call_screen.dart';
import 'package:junohealthapp/shared_preferences/preference_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'core/firebase/firebase_options.dart';
import 'firebase/notifi_service.dart';
import 'main.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification?.body != null) {}
  print('==444444======${message.data.toString()}');
  LocalNotificationService.display(message);
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
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> messageHandler() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    LocalNotificationService.display(event);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  PreferenceHelper.load().then((value) {});
  await FirebaseService.setupFirebase();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}

    //   final fcmToken = await FirebaseMessaging.instance.getToken();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
  }
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  // call the useSystemCallingUI
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MyApp(navigatorKey: navigatorKey));
  });
  //runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.navigatorKey});
  GlobalKey<NavigatorState> navigatorKey;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      final navigatorKey = GlobalKey<NavigatorState>();
      Firebase.initializeApp();
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      firebaseMessaging.requestPermission(
          alert: true, badge: true, sound: true);
      LocalNotificationService.initialize(context, navigatorKey);
      // LocalNotificationService.initialize(context, navigatorKey);
      LocalNotificationService.requestIOSPermissions();

      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          final routeFromMessage = message.data["type"];
        }
      });

      ///forground work
      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          if (kDebugMode) {
            print(message.notification!.body);
          }
          if (kDebugMode) {
            print(message.notification!.title);
          }
        }
        print('=====ddddddeeree===${message}');

        showNotification(message);
      });

      ///When the app is in background but opened and user taps
      ///on the notification
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('======message=====$message');
      });
    }
    getToken();
    // Handle messages when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('======dddddd=====$message');
      if (message.data['call'] == 'start') {}
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print('===========$message');
      if (message != null && message.data['call'] == 'start') {}
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    LocalNotificationService.display(message);
  }

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('==getToken==== $token');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: widget.navigatorKey,
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
