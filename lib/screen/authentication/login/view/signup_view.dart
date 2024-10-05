import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';

import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_drop_down_view.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
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
      child: Consumer<AuthProvider>(builder: (context, provider, child) {
        return ListView(
          children: [
            commonTextFiledView(
                title: name, topText: size.height * zero001, topTextField: ten),
            CommonTextWidget(
              text: gender,
              top: ten,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Male Radio Button
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: provider.selectedGender,
                  onChanged: (Gender? value) {
                    if (value != null) {
                      provider.selectGender(value);
                    }
                  },
                ),
                CommonTextWidget(text: male),
                // Female Radio Button
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: provider.selectedGender,
                  onChanged: (Gender? value) {
                    if (value != null) {
                      provider.selectGender(value);
                    }
                  },
                ),
                CommonTextWidget(text: female),
              ],
            ),
            commonDropDownWithTextView(
              selectedValue: provider.selectedValue,
              hint: age,
              topDropDownValue: ten,
              size: size,
              title: age,
              items: provider.ageNumbers,
              onChanged: (String? value) {
                provider.selectionValue = value ?? '';
              },
            ),
            commonDropDownWithTextView(
              selectedValue: provider.selectedValueHeight,
              hint: age,
              topText: size.height * zero002,
              topDropDownValue: ten,
              size: size,
              title: height,
              items: provider.height,
              onChanged: (String? value) {
                provider.selectionValueHeightValue = value ?? '';
              },
            ),
            commonDropDownWithTextView(
              selectedValue: provider.selectedValueWight,
              hint: weight,
              topText: size.height * zero002,
              topDropDownValue: ten,
              size: size,
              title: weight,
              items: provider.weight,
              onChanged: (String? value) {
                provider.selectionValueWeightValue = value ?? '';
              },
            ),
            commonTextFiledView(
                hint: health,
                title: health,
                topText: size.height * zero002,
                topTextField: ten),
            commonTextFiledView(
                title: allergies,
                hint: allergies,
                topText: size.height * zero002,
                topTextField: ten),
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
              onPressed: () {},
              text: signup,
            ),
          ],
        );
      }),
    );
  }
}
