import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: thirtyFive,
                height: thirtyFive,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              CommonTextWidget(
                text: 'AI Doctor',
                textColor: Colors.white,
              ),
            ],
          )),
      body: Column(
        children: [
          const Expanded(child: ChatMessagesList()), // Messages List
          ChatInputField(), // Input field
        ],
      ),
    );
  }
}

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return ListView.builder(
          itemCount: chatProvider.messages.length,
          itemBuilder: (context, index) {
            final message = chatProvider.messages[index];
            return Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(ten),
                margin: const EdgeInsets.symmetric(
                    vertical: four, horizontal: sixteen),
                decoration: BoxDecoration(
                  color: message.isSentByMe ? colorSender : Colors.grey[300],
                  borderRadius: BorderRadius.circular(eight),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                      color: message.isSentByMe ? Colors.white : Colors.black),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return Container(
          margin: const EdgeInsets.all(twenty),
          child: Padding(
            padding: const EdgeInsets.all(zero),
            child: Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    iconWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: ten,
                        ),
                        setAssetImage(
                            fit: BoxFit.scaleDown,
                            image: icSmile,
                            width: twentyThree,
                            height: twentyThree)
                      ],
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        setAssetImage(
                            fit: BoxFit.scaleDown,
                            image: icAttach,
                            width: twentyThree,
                            height: twentyThree),
                        const SizedBox(
                          width: five,
                        ),
                        setAssetImage(
                            fit: BoxFit.scaleDown,
                            image: icCamera,
                            width: twentyThree,
                            height: twentyThree),
                        const SizedBox(
                          width: ten,
                        )
                      ],
                    ),
                    radius: twenty,
                    colorFill: Colors.white,
                    isFill: true,
                    //onChange: (text) => chatProvider.updateCurrentMessage(text),
                    controller: chatProvider.tetChat,
                  ),
                ),
                const SizedBox(
                  width: ten,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: colorSplash, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: twenty,
                    ),
                    onPressed: () {
                      chatProvider.sendMessage();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
