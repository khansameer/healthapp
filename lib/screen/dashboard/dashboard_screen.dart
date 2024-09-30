import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_app_scaffold_view.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/screen/notification/notification_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return CommonAppScaffoldView(
      colorBg: colorBG,
      appbar: AppBar(
        backgroundColor: colorBG,
        centerTitle: false,
        title: ListTile(
          leading:
              setAssetImage(image: icDummyUser, width: fifty, height: fifty),
          title: Row(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
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
          setAssetImage(image: icDummyUser, width: fifty, height: fifty)
        ],
      ),
    );
  }
}
