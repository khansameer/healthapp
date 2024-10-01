import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ListView(
      children: [
        Container(
          width: size.width,
          color: colorPinkLight,
          height: size.height * zero03,
          child: Padding(
            padding: const EdgeInsets.only(left: twenty, right: twenty),
            child: Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * zero009,
                        ),
                        CommonTextWidget(
                          text: createProfile,
                          fontWeight: FontWeight.w700,
                        ),
                        CommonTextWidget(
                          fontSize: ten,
                          top: ten,
                          text: createProfileDesc,
                        ),
                        CommonButtonWidget(
                          text: signup,
                          height: thirty,
                          top: ten,
                          fontSize: twelve,
                          width: size.width * zero03,
                          padding: EdgeInsets.zero,
                          colorButton: colorSplash,
                          onPressed: () {
                            pushNamedAndRemoveUntil(
                                context: context, routeName: RouteName.login);
                          },
                        )
                      ],
                    )),
                Expanded(flex: 5, child: setAssetImage(image: icProfileBG))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(twenty),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonHeader(),
              commonDivider(),
              commonContent(),
              commonContent(text: symptomsTacker),
              commonContent(text: aiDoctor),
              commonContent(text: medicineReminder),
              commonContent(text: pregnancy),
              SizedBox(
                height: size.height * zero002,
              ),
              commonHeader(title: save),
              commonDivider(),
              commonContent(text: myHealthGoal),
              commonContent(
                  text: interactionCheck,
                  onTap: () {
                    pushScreen(
                        context: context,
                        routeName: RouteName.interactionCheckScreen);
                  }),
              commonContent(text: myHealth),
            ],
          ),
        )
      ],
    );
  }

  commonHeader({String? title}) {
    return CommonTextWidget(
      text: title ?? myTool,
      fontWeight: FontWeight.w600,
    );
  }

  commonContent({String? text, VoidCallback? onTap}) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          visualDensity: const VisualDensity(vertical: -4),
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: CommonTextWidget(
            fontSize: thirteen,
            text: text ?? medicineReminder,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: twenty,
          ),
        ),
        commonDivider(),
      ],
    );
  }

  commonDivider() {
    return const Divider();
  }
}
