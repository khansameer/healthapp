import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.text, required this.isSentByMe});
}

class ChatProvider extends ChangeNotifier {
  List<ChatMessage> _messages = [];
  String _currentMessage = '';
  TextEditingController _tetChat = TextEditingController();
  TextEditingController get tetChat => _tetChat;
  List<ChatMessage> get messages => _messages;
  String get currentMessage => _currentMessage;

  void updateCurrentMessage(String message) {
    _currentMessage = message;
    notifyListeners();
  }

  void sendMessage() {
    if (tetChat.text.isNotEmpty) {
      _messages.add(ChatMessage(text: tetChat.text, isSentByMe: true));
      tetChat.text = '';
      notifyListeners();
    }
  }

  void receiveMessage(String message) {
    _messages.add(ChatMessage(text: message, isSentByMe: false));
    notifyListeners();
  }
}
