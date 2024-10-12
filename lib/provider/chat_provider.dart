import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class ChatMessage {
  final String text;
  final bool isSentByMe;
  final String? sender;

  final DateTime time;
  ChatMessage(
      {required this.text,
      required this.isSentByMe,
      required this.time,
      this.sender});
}

class ChatProvider extends ChangeNotifier {
  final List<ChatMessage> _messages = [
    ChatMessage(
        sender: 'Alice',
        text: 'Hi there!',
        time: DateTime.now().subtract(Duration(minutes: 2)),
        isSentByMe: true),
    ChatMessage(
        sender: 'Bob',
        text: 'Hello!',
        time: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        sender: 'Alice',
        text: 'How are you?',
        time: DateTime.now(),
        isSentByMe: false),
    ChatMessage(
        sender: 'Bob',
        text: 'I am good, thanks! And you?',
        time: DateTime.now().add(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        sender: 'Alice',
        text: 'Doing well, just working on a Flutter project.',
        time: DateTime.now().add(Duration(minutes: 2)),
        isSentByMe: false),
  ];
  String _currentMessage = '';
  final TextEditingController _tetChat = TextEditingController();
  TextEditingController get tetChat => _tetChat;
  List<ChatMessage> get messages => _messages;
  String get currentMessage => _currentMessage;

  void updateCurrentMessage(String message) {
    _currentMessage = message;
    notifyListeners();
  }

  void sendMessage() {
    if (tetChat.text.isNotEmpty) {
      _messages.add(ChatMessage(
          text: tetChat.text, isSentByMe: true, time: DateTime.now()));
      tetChat.text = '';
      notifyListeners();
    }
  }

  void receiveMessage(String message) {
    _messages.add(
        ChatMessage(text: message, isSentByMe: false, time: DateTime.now()));
    notifyListeners();
  }

  Future<void> sendFCMMessage(
      {required String msg, required String currentFCMToken}) async {
    final String serverKey = await getAccessToken();
    print('=======================sssssssss${serverKey}');
    String fcmEndpoint =
        'https://fcm.googleapis.com/v1/projects/healthapp-a107f/messages:send';

    Map<String, dynamic> message = {
      'message': {
        'token': currentFCMToken,
        'notification': {'body': msg, 'title': 'New Message From Admin'},
        'data': {
          'current_user_fcm_token': currentFCMToken,
        },
      }
    };

    final http.Response response = await http.post(
      Uri.parse(fcmEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('FCM message sent successfully');
      }
    } else {
      if (kDebugMode) {
        print('Failed to send FCM message: ${response.statusCode}');
      }
    }
  }

  Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "healthapp-a107f",
      "private_key_id": "cc1254911198ed4e86c66ca79e2cf07594444583",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDBXdgnS0ECBUx4\nCdtQfnZY7kb9T1POzDF3x7hQoYayjziNY+4kKxxxtqx0vsZ9vy6FUGGNzTsHZk+Y\n90zRjRNoHgsMcHvRFup6rtWayoo5APLBZxZ1/H1Z9SP/6wTE1kaRtt99e9CFka2C\nj6rBiCjFvDpWVk9ukIxG4hYGdRGvK6EP5+yuPv0/j8rJu4L+IaIQ+RTOBv9lvneJ\nRvxzKBcGKTiqaXluSJh7GWQmbE3CKvtT/uz2B1oNF/BEzTRb8XpIbCCxSIB78nCu\nMqkwvI7FXWsuJlS9T/3B0ndOniHaf7svW0mrv8ZCMOycJi/w3E4iIabXxW7x1TKe\nunR2Z2vTAgMBAAECggEAU9dc4ay/gyDJB0M+1KgAqI6oOS0sKX5f9I+kW1GuFb4D\nx0qM9yG6M5QBMp2FcwByK1uu8M0LyymRWcHgjPueboaYQ8yB4ycMhCVKeNNZG15N\n443PL1lLALZJ5a0BZFeEQaoJPV9yCngfw3yHjWJ8S0BSCx1hU49ZQ2LEKgiYolqG\nbfMWnCs4RnzEwGh2zuPZGGsk2LXGUqpVjQML1PgdIiZVsJuNbzbttLDz8sAn+/RJ\nDsfWSy5ThaLLX3bC3EOUjvDiDgGpieUtKxfdh+w8kpKhAdNtBMEMPAzZxVMED+ZI\n+8ZIs9AlC15wPQ5C8aMnCdggqrh90F8wa/6KM05AAQKBgQD3sQ5tplrEJ5UApgpR\nbOAyjC2ys90z/CJhcGjUi/VVYQs6rhurZ9qGxuAUxvztim3RfeGXOUAYRbbYZH8S\n4I5xix2qKwI1pidoBQxQk4gr1sB+4nLhe53s+ZdbA0XHTruDxrztpJ6RgElN2Paz\nyYcm/phIeYNG7vWxZ4rtfnK5YQKBgQDH2kueB0xmMgY4Sn31GtE4M3V/eQ7+E0Lu\nZC1/5ymoCfyfzAEjQu5im7tAD2Xo5sN16rgZmiRiwIwu6z2tay9Ha2IzptFSzZal\nV86g+fIKJmdpzhyKra1MxbLXhJlsGvPZHq3i//yoZsY34lWJ/g1vYdB7K96etMYg\n05dmOzHtswKBgF6vi6F1D4ueygIWdylLYqVQGwQOaAhAYXA4RYrC+gUqdN14w1ES\nAWK2UeD/dJ7l5TdJVNy3YP4mYFB2knFH8IwNL0jm6hBSNQw5qcx/qXWAwdN/g4UY\n+XUmsKp1JM6dFWe5qG18GbXrgZpFz4FJD+ZjOxmxgfKy1K99sok5ZmfhAoGBAJeO\nKJfvivVY7DSV8Q0FyDFpfKotgLwWmUQ1PffnskRXRndb+mTmJecrmAWNZ8gF76Yl\nWHU52mv0/pm6FSzEwrbTbUYkNEsp0xsSCoUy5mTiGLw47JYR/QDiT6x2Ru6fRdqa\nFF23qL+AKMNKZXne6gtUTwiJDSqnhjRwoTiKnWNXAoGBAKLQgPwtSREkCdtdRv/x\nMX5TIaxEITM7KDhZtLQDq3EvPxLRMzQ6qNpmWQ6+OLZ0j+ehECHFLy/sCamtj3n+\nZWlXHjxTS7Lh42kWdM2fkw7N7Gsk4ZjCrHDf0uTBTi/EAhkS+L2RzDJtJhVpDMXl\nEhJsavj02wU3VtmmzbMasVYf\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-n485u@healthapp-a107f.iam.gserviceaccount.com",
      "client_id": "102915007460504325614",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-n485u%40healthapp-a107f.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();

    return credentials.accessToken.data;
  }
}
