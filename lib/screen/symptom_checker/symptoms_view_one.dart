import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/provider/symptoms_cheeker_provider.dart';
import 'package:provider/provider.dart';

class SymptomsViewOne extends StatelessWidget {
  const SymptomsViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: "Select a Specific Area"),
      body: Consumer<SymptomsCheekerProvider>(
          builder: (context, provider, child) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              onTap: () {
                pushScreen(
                    context: context,
                    routeName: RouteName.symptomsViewTwoScreen);
              },
              title: CommonTextWidget(
                fontSize: thirteen,
                text: provider.bodyPartList[index].toString(),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: twenty,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: provider.bodyPartList.length,
        );
      }),
    );
  }
}
