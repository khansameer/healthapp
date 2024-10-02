import 'package:flutter/material.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';

import '../../core/app_constants.dart';

class SymptomsViewThree extends StatelessWidget {
  const SymptomsViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: mySymptoms),
      body: CommonsScreenContainer(
        child: ListView(
          children: [
            CommonTextWidget(
              top: size.height * zero002,
              text: mySymptoms,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: size.height * zero001, right: size.width * zero03),
              padding: const EdgeInsets.all(ten),
              decoration: commonBoxDecoration(
                  color: colorGreen,
                  borderRadius: BorderRadius.circular(eight)),
              child: CommonTextWidget(
                textColor: Colors.white,
                text: "Lump under base of skull",
              ),
            ),
            CommonTextWidget(
              top: size.height * zero002,
              textColor: colorGreen,
              fontWeight: FontWeight.w700,
              text: skipSection,
            ),
            SizedBox(
              height: size.height * zero003,
            ),
            commonRow(),
            SizedBox(
              height: size.height * zero003,
            ),
            commonRow(title: passOrMedication),
            CommonButtonWidget(
              top: size.height * zero02,
              text: findDoctor,
              onPressed: () {
                pushScreen(
                    context: context, routeName: RouteName.doctorListScreen);
              },
            )
          ],
        ),
      ),
    );
  }

  commonRow({String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          decoration:
              commonBoxDecoration(color: colorGreen, shape: BoxShape.circle),
          height: 30,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        CommonTextWidget(
          left: ten,
          fontSize: fourteen,
          text: title ?? "Current Medications",
        ),
        CommonTextWidget(
          left: ten,
          fontSize: fourteen,
          text: "(Optional)",
          textColor: Colors.grey,
        )
      ],
    );
  }
}
