import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/string/string_utils.dart';

import '../../core/route/route.dart';

class InteractionCheckPhaseOneScreen extends StatelessWidget {
  const InteractionCheckPhaseOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: interactionCheck),
      body: CommonsScreenContainer(
        child: ListView(
          children: [
            CommonTextWidget(
              top: size.height * 0.03,
              text: "Report:",
              fontWeight: FontWeight.w600,
            ),
            CommonTextWidget(
              top: size.height * 0.03,
              text: reportDesc,
            ),
            SizedBox(
              child: CommonButtonWidget(
                top: size.height * 0.03,
                right: size.width * 0.4,
                text: save,
                onPressed: () {
                  pushNamedAndRemoveUntil(
                      context: context, routeName: RouteName.dashboardScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
