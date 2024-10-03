import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(ten),
          itemCount: chatProvider.messages.length,
          itemBuilder: (context, index) {
            final message = chatProvider.messages[index];
            return Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  message.isSentByMe
                      ? const SizedBox.shrink()
                      : Container(
                          width: thirtyFive,
                          height: thirtyFive,
                          decoration: commonBoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: ClipOval(
                              child: setAssetImage(image: icChatUserIcon),
                            ),
                          ),
                        ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(ten),
                      margin: const EdgeInsets.symmetric(
                          vertical: four, horizontal: sixteen),
                      decoration: BoxDecoration(
                        color: message.isSentByMe ? colorSender : colorSender,
                        borderRadius: BorderRadius.circular(eight),
                      ),
                      child: Flexible(
                        child: CommonTextWidget(
                          text: message.text,
                          textColor: Colors.white,
                          fontSize: thirteen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
