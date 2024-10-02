import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/screen/chat_screen/chat_input_widget.dart';
import 'package:junohealthapp/screen/chat_screen/chat_list_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, this.isAI = false});
  final bool? isAI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: ten),
              color: isAI == true ? colorSplash : colorGreen,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: thirtyFive,
                        height: thirtyFive,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      CommonTextWidget(
                        left: 10,
                        text: isAI == true ? 'AI Doctor' : "AI Therapist",
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )),
      body: const Column(
        children: [
          Expanded(child: ChatListWidget()), // Messages List
          ChatInputWidget(), // Input field
        ],
      ),
    );
  }
}
