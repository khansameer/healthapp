import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/string/string_utils.dart';

import 'package:junohealthapp/screen/health_goal/step_widget.dart';

class HealthGoalView extends StatelessWidget {
  const HealthGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppBar(title: healthGoal),
        body: ListView(
          children: [
            SizedBox(
              height: size.height * zero003,
            ),
            setAssetImage(
                fit: BoxFit.scaleDown,
                image: icHealthGoal,
                width: size.width * zero02,
                height: size.height * zero20),
            Align(
              alignment: Alignment.center,
              child: CommonTextWidget(
                top: size.height * zero003,
                text: setYourHealthGoal,
                fontSize: eighteen,
                fontWeight: FontWeight.w700,
              ),
            ),
            const StepWidget(),
            SizedBox(
              height: size.height * zero003,
            ),
          ],
        ),
      ),
    );
  }
}
