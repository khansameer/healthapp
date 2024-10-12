import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../screen/dashboard/dashboard_screen.dart';
import 'note.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(
      BuildContext context, GlobalKey<NavigatorState> navigatorKey) {
    var androidSetup =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetup = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentBadge: true,
    );
    final setupNotification =
        InitializationSettings(android: androidSetup, iOS: iosSetup);
    _notificationsPlugin.initialize(setupNotification,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      print('==55555======${notificationResponse.payload}');
      Note note = Note.fromJsonString(notificationResponse.payload ?? '');
      if (note.type == "1") {
        try {
          Navigator.push(
              navigatorKey.currentState!.context,
              MaterialPageRoute(
                  builder: (context) => const DashboardScreen(
                      // data: data,
                      )));
        } catch (e) {
          if (kDebugMode) {
            print('error$e');
          }
        }
      }
    });
  }

  static Future<void> requestIOSPermissions() async {
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static void display(RemoteMessage message) async {
    print('==88888======${message.toString()}');
    Note newNote = Note(
      //   senderId: message.data["senderId"],
      //image: message.data["image"],
      //senderRole: message.data["senderRole"],
      type: message.data["type"],
      name: message.data["title"],
    );
    String noteJsonString = newNote.toJsonString();

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      var iosDetail = const DarwinNotificationDetails(
        //  badgeNumber: int.parse('${message.notification?.apple?.badge}'),
        presentBadge: true,
      );
      final NotificationDetails notificationDetails = NotificationDetails(
          iOS: iosDetail,
          android: const AndroidNotificationDetails(
            "healthApp",
            "healthApp",
            setAsGroupSummary: true,
            visibility: NotificationVisibility.public,
            importance: Importance.max,
            priority: Priority.high,
            channelShowBadge: true,
          ));

      await _notificationsPlugin.show(
        id,
        message.data["title"],
        message.data["body"],
        notificationDetails,
        payload: noteJsonString,
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
