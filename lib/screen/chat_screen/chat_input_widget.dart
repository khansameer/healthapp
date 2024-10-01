import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/provider/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({super.key});

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
