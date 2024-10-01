import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isSentByMe;
  final String? sender;

  final DateTime time;
  ChatMessage({required this.text, required this.isSentByMe,required this.time,this.sender});
}

class ChatProvider extends ChangeNotifier {


  final List<ChatMessage> _messages = [
    ChatMessage(sender: 'Alice', text: 'Hi there!', time: DateTime.now().subtract(Duration(minutes: 2)), isSentByMe: true),
    ChatMessage(sender: 'Bob', text: 'Hello!', time: DateTime.now().subtract(Duration(minutes: 1)),isSentByMe: false),
    ChatMessage(sender: 'Alice', text: 'How are you?', time: DateTime.now(),isSentByMe: false),
    ChatMessage(sender: 'Bob', text: 'I am good, thanks! And you?', time: DateTime.now().add(Duration(minutes: 1)),isSentByMe: false),
    ChatMessage(sender: 'Alice', text: 'Doing well, just working on a Flutter project.', time: DateTime.now().add(Duration(minutes: 2)),isSentByMe: false),
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
      _messages.add(ChatMessage(text: tetChat.text, isSentByMe: true, time:  DateTime.now()));
      tetChat.text = '';
      notifyListeners();
    }
  }

  void receiveMessage(String message) {
    _messages.add(ChatMessage(text: message, isSentByMe: false, time:  DateTime.now()));
    notifyListeners();
  }
}
