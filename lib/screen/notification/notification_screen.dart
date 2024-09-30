import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/string/string_utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: notifications),
      body: ListView(
        children: [
          ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: forty,
                  height: forty,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                ),
                title: CommonTextWidget(
                  fontSize: thirteen,
                  text: "You enable weekly health goal ",
                ),
                trailing: CommonTextWidget(
                  text: "09:00pm",
                  fontSize: ten,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          )
        ],
      ),
    );
  }
}
