import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_reset_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class ForgotPasswordOptView extends StatelessWidget {
  const ForgotPasswordOptView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: forgotPasswordText),
      body: Consumer<AuthProvider>(builder: (context, provider, child) {
        return Container(
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
                text: checkYourEmail,
              ),
              SizedBox(
                height: size.height * zero002,
              ),
              RichText(
                text: TextSpan(
                    text: weSent,
                    style: commonTextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' contact@dscode...com',
                        style: commonTextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' $enterText',
                        style: commonTextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ]),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: fiftyFive),
                  alignment: Alignment.center,
                  width: size.width,
                  child: PinCodeTextField(
                    length: 5,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(twelve),
                      fieldHeight: fifty,
                      fieldWidth: fifty,
                      borderWidth: four,
                      selectedColor: colorGreen,
                      activeBorderWidth: zero05,
                      disabledBorderWidth: zero05,
                      inactiveBorderWidth: zero05,
                      activeColor: colorGreen,
                      inactiveColor: Colors.grey,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    textStyle: commonTextStyle(
                        //textColor: Colors.white,
                        fontSize: fourteen,
                        fontWeight: FontWeight.w600),
                    enableActiveFill: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // controller: tetOTP,
                    onCompleted: (v) {
                      provider.updatePin(v);
                    },
                    onChanged: (value) {
                      if (kDebugMode) {
                        print(value);
                      }
                    },
                    beforeTextPaste: (text) {
                      if (kDebugMode) {
                        print("Allowing to paste $text");
                      }
                      return true;
                    },
                    appContext: context,
                  ),
                ),
              ),
              CommonButtonWidget(
                top: size.height * zero004,
                text: verifyCode,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ForgotPasswordResetView()));
                },
              ),
              SizedBox(
                height: size.height * zero008,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: haveCode,
                      style: commonTextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' $resendEmil',
                            style: commonTextStyle(
                                color: colorGreen, fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              })
                      ]),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
