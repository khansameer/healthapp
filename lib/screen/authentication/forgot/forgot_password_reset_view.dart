import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordResetView extends StatelessWidget {
  const ForgotPasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: forgotPasswordText),
      body: Consumer<AuthProvider>(builder: (context, provider, child) {
        return CommonsScreenContainer(

          child: ListView(
            children: [
              CommonTextWidget(
                top: size.height * zero002,
                textColor: Colors.black,
                fontSize: sixteen,
                fontWeight: FontWeight.w700,
                text: setNewPassword,
              ),
              CommonTextWidget(
                lineHeight: 1.5,
                top: size.height * zero002,
                textColor: Colors.black,
                text:passwordTitleDesc,
              ),
              commonTextFiledView(
                  obscureText: !provider.isPasswordVisible,
                  title: password,
                  suffixIcon: IconButton(
                    onPressed: provider.togglePasswordVisibility,
                    icon: Icon(
                      color: Colors.grey,
                      provider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  topText: size.height * zero005,
                  hint: enterNewPassword,
                  topTextField: ten),
              commonTextFiledView(
                  hint: reEnterPassword,
                  obscureText: !provider.isConfirmPasswordVisible,
                  title: confirmPassword,
                  suffixIcon: IconButton(
                    onPressed: provider.togglePasswordVisibility,
                    icon: Icon(
                      color: Colors.grey,
                      provider.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  topText: fifteen,
                  topTextField: ten),
              CommonButtonWidget(
                onPressed: () {
                  showCommonDialog(
                      btnNegative: cancel,
                      context: context,title: passwordReset,content: passwordResetMsg,
                  onPressPositive: (){
                    pushNamedAndRemoveUntil(context: context,routeName: RouteName.login);
                  });

                },
                top: size.height * zero004,
                text: updatePassword,
              ),
            ],
          ),
        );
      }),
    );
  }
}
