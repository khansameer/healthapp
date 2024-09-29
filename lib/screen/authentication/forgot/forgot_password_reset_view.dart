import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:junohealthapp/screen/authentication/forgot/forgot_password_opt_view.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';
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
                text: "Set a new password",
              ),
              CommonTextWidget(
                lineHeight: 1.5,
                top: size.height * zero002,
                textColor: Colors.black,
                text:
                    "Create a new password. Ensure it differs from\nprevious ones for security",
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
                  topText: size.height * 0.05,
                  hint: "Enter your new password",
                  topTextField: ten),
              commonTextFiledView(
                  hint: "Re-enter password",
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
                  showAlertDialog(
                      context: context,
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false);
                      });
                  /*Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false);*/
                  /*   showMessageDialog(
                      onTapClose: () {
                        Navigator.of(context).pop();
                        */ /*Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false);*/ /*
                      },
                      context: context,
                      title: "Password Reset",
                      content: "Your password has been successfully reset.");*/
                },
                top: size.height * zero004,
                text: "Update Password",
              ),
            ],
          ),
        );
      }),
    );
  }
}
