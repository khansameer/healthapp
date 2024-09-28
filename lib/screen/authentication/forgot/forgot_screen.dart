import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_opt_view.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: forgotPasswordText),
      body: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.only(left: ten, right: ten),
        child: ListView(
          children: [
            CommonTextWidget(
              top: size.height * zero002,
              textColor: Colors.black,
              fontSize: sixteen,
              fontWeight: FontWeight.w700,
              text: forgotPasswordText,
            ),
            CommonTextWidget(
              top: size.height * zero002,
              textColor: Colors.black,
              text: forgotPasswordTextDesc,
            ),
            commonTextFiledView(
                title: yourEmail,
                hint: enterYourEmail,
                topText: size.height * zero005,
                topTextField: ten),
            CommonButtonWidget(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordOptView()));
              },
              top: size.height * zero004,
              text: resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
