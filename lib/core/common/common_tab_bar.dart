import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';

import '../component/component.dart';

class CommonTabBar extends StatelessWidget {
  const CommonTabBar(
      {super.key,
      required this.length,
      required this.children,
      required this.tabs});

  final int length;
  final List<Widget> tabs;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: CommonTextWidget(
              text: "Login",
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              //padding: const EdgeInsets.all(twenty),
              labelStyle: commonTextStyle(
                  fontSize: sixteen, fontWeight: FontWeight.w600),
              unselectedLabelStyle: commonTextStyle(
                  fontSize: sixteen, fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicatorColor: colorGreen,
              unselectedLabelColor: Colors.grey.withOpacity(0.70),
              labelColor: colorGreen,
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: children,
          ),
        ),
      ),
    );
  }
}
