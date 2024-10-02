import 'package:flutter/material.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/route/route.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.forgotPasswordScreen);
              },
              text: "One1",
            ),
            CommonButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.dashboardScreen);
              },
              text: "One1",
            ),
            CommonButtonWidget(
              onPressed: () {},
              text: "One1",
            ),
          ],
        ),
      ),
    );
  }
}
