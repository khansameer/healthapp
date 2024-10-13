import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_app_scaffold_view.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/video_auth.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';
import 'package:junohealthapp/screen/notification/notification_screen.dart';
import 'package:junohealthapp/shared_preferences/preference_helper.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onUserLogin();
    });
  }

  Future<void> onUserLogin() async {
    String userID =
        await PreferenceHelper.getString(key: PreferenceHelper.userID);
    String userName =
        await PreferenceHelper.getString(key: PreferenceHelper.userName);
    print('==========userName$userName');
    print('==========userID$userID');

    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: VideoAuth.appID /*input your AppID*/,
      appSign: VideoAuth.appSign /*input your AppSign*/,
      userID: userID,
      notificationConfig: ZegoCallInvitationNotificationConfig(
          androidNotificationConfig: ZegoCallAndroidNotificationConfig()),
      userName: userName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return CommonAppScaffoldView(
      colorBg: colorBG,
      appbar: AppBar(
        backgroundColor: colorBG,
        centerTitle: false,
        leadingWidth: 0,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: setAssetImage(image: icDummyUser, width: 40, height: fifty),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(
                text: "Hi Emma,",
                fontSize: twelve,
              ),
              commonInkWell(
                  child: setAssetImage(
                      fit: BoxFit.scaleDown,
                      image: icBell,
                      width: eighteen,
                      height: eighteen),
                  onTap: () {
                    pushScreen(
                        context: context,
                        routeName: RouteName.notificationScreen);
                  })
            ],
          ),
          subtitle: CommonTextWidget(
            top: five,
            fontSize: ten,
            text: "How do you feel today?",
          ),
        ),
        actions: [
          CommonButtonWidget(
            text: "Logout",
            padding: EdgeInsets.zero,
            right: 10,
            onPressed: () async {
              onUserLogout();
              await PreferenceHelper.clear();
              navigatorKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
            width: 100,
            height: 35,
          )
          // setAssetImage(image: icDummyUser, width: fifty, height: fifty)
        ],
      ),
    );
  }
}
