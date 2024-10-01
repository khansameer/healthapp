import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';

class InteractionCheckScreen extends StatelessWidget {
  const InteractionCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: commonAppBar(title: interactionCheck),
      backgroundColor: Colors.white,
      body: CommonsScreenContainer(
        child: ListView(
          children: [
            CommonTextWidget(
              text: selectMedicine,
            ),
            SizedBox(
              height: size.height * zero009,
            ),
            _imageView(),
            CommonButtonWidget(
              top: size.height * zero009,
              text: next,
              onPressed: () {
                pushScreen(
                    context: context,
                    routeName: RouteName.interactionCheckPhaseOneScreen);
              },
            )
          ],
        ),
      ),
    );
  }

  _imageView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        setAssetImage(
            fit: BoxFit.scaleDown,
            width: oneHundred,
            height: oneHundred,
            image: icMedicine1),
        setAssetImage(
            fit: BoxFit.scaleDown,
            width: oneHundred,
            height: oneHundred,
            image: icMedicine2)
      ],
    );
  }
}
