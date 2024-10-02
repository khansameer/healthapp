import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';

class SymptomsCheckerViewDetails extends StatelessWidget {
  const SymptomsCheckerViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: symptomChecker),
      body: CommonsScreenContainer(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: CommonTextWidget(
                top: size.height * zero002,
                fontWeight: FontWeight.w700,
                fontSize: sixteen,
                text: symptomCheckerDesc,
              ),
            ),
            SizedBox(
              height: size.height * zero002,
            ),
            commonInkWell(
                child: setAssetImage(
                  height: size.height * zero07,
                  image: icMen,
                  fit: BoxFit.scaleDown,
                ),
                onTap: () {
                  pushScreen(
                      context: context,
                      routeName: RouteName.symptomsViewOneScreen);
                })
          ],
        ),
      ),
    );
  }
}
