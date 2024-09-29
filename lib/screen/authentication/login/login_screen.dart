import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/screen/authentication/login/view/login_view.dart';
import 'package:junohealthapp/screen/authentication/login/view/signup_view.dart';

import '../../../core/common/common_tab_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: const CommonTabBar(
        length: 2,
        tabs: [
          Tab(text: login),
          Tab(text: signup),
        ],
        children: [LoginView(), SignupView()],
      ),
    );
  }
}
