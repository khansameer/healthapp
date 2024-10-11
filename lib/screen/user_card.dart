import 'package:flutter/material.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/video_auth.dart';
import 'package:junohealthapp/firebase/models/user.dart';
import 'package:junohealthapp/provider/chat_provider.dart';
import 'package:junohealthapp/screen/video_call_screen.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../shared_preferences/preference_helper.dart';

class UserCard extends StatefulWidget {
  Map<String, dynamic> data;

   UserCard({
    required this.data,
    super.key,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  String? email;
  @override
  void initState() {


    super.initState();
    gmailEmail();
  }

  gmailEmail() async {
    email=await  PreferenceHelper.getString(key: PreferenceHelper.email);

    print('=====email$email');
    /*if (model.username !=
        FirebaseService.currentUser.username) {*/

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context,provider,child) {
        if(widget.data['email']!=email){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.5),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Container(
                width: 50,
                height: 50,
                decoration:
                const BoxDecoration(shape: BoxShape.circle, color: colorFillBg),
                child: Center(
                  child: CommonTextWidget(
                    text: widget.data['name'][0],
                    fontWeight: FontWeight.w700,
                    textColor: Colors.blueAccent,
                    fontSize: 16,
                  ),
                ),
              ),
              trailing:  Container(
                width: 35,
                height: 35,
                decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Center(
                    child: IconButton(
                        onPressed: (){
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return VideoCallScreen(name: widget.data['name'],userID: widget.data['username'],);
                          }),
                        );
                         // provider.sendFCMMessage(msg: "Hi ghow arwe yyoy", currentFCMToken: widget.data['token'].toString());
                        },
                        icon: const Icon(
                          Icons.videocam_outlined,
                          color: Colors.white,
                          size: 20,
                        ))),
              ),
              title: CommonTextWidget(
                text: widget.data['name'],
                textColor: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          );
        }
        else
          {
            return Center(
              child: CommonTextWidget(text: "No ",),
            );
          }

      }
    );
  }

  ZegoSendCallInvitationButton actionButton(bool isVideo) =>
      ZegoSendCallInvitationButton(
        iconSize: Size(40, 40),
        isVideoCall: isVideo,
        resourceID: "zegouikit_call",
        invitees: [
          ZegoUIKitUser(
            id: widget.data['username'],
            name: widget.data['name'],
          ),
        ],
      );

  void onUserLogin() {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: VideoAuth.appID /*input your AppID*/,
      appSign:  VideoAuth.appSign /*input your AppSign*/,
      userID: widget.data['name'],
      userName:widget.data['username'],
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
