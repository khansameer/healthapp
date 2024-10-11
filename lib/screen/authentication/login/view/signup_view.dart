
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';

import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/component/component.dart';

import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Consumer<AuthProviders>(builder: (context, provider, child) {
        return Stack(
          children: [
            ListView(
              children: [
                commonTextFiledView(
                  controller: provider.tetName,
                    title: name, topText: fifteen, topTextField: ten),
                commonTextFiledView(
                    controller: provider.tetUserName,
                    title: "Username", topText: fifteen, topTextField: ten),


                commonTextFiledView(
                    title: yourEmail,
                    hint: enterYourEmail,
                    controller: provider.tetEmail,
                    topText: fifteen,
                    topTextField: ten),
                commonTextFiledView(
                    controller: provider.tetPassword,
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
                    topText: fifteen,
                    topTextField: ten),
                commonTextFiledView(
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
                  top: twenty,
                  onPressed: ()  {

                 //  provider.singupWithFirebase(context);
                    provider.addNewUsers(context);
                  },
                  text: signup,
                ),
              ],
            ),
            provider.isFetching?showLoaderList():const SizedBox.shrink()
          ],
        );
      }),
    );
  }
}
