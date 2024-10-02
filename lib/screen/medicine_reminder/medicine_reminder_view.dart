import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/medicine_provider.dart';
import 'package:provider/provider.dart';

class MedicineReminderView extends StatelessWidget {
  const MedicineReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final itemProvider = Provider.of<MedicineProvider>(context);

    return Scaffold(
      backgroundColor: colorBG,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorSplash,
        elevation: zero,
        onPressed: () {
          pushScreen(context: context, routeName: RouteName.addReminderScreen);
        },
        foregroundColor: colorSplash,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: commonAppBar(color: colorBG, title: medicineReminder),
      body: CommonsScreenContainer(
        color: colorBG,
        child: ListView(
          children: [
            SizedBox(
              height: size.height * zero003,
            ),
            setAssetImage(
                fit: BoxFit.scaleDown,
                image: icMedicineIcon,
                height: size.height * zero03),
            SizedBox(
              height: size.height * zero002,
            ),
            SizedBox(
              height: size.height,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: itemProvider.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = itemProvider.items[index];
                  return Container(
                      margin: const EdgeInsets.all(ten),
                      padding: const EdgeInsets.all(five),
                      decoration: commonBoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(ten)),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: CommonTextWidget(
                          text: item.name,
                          left: ten,
                          fontWeight: FontWeight.w600,
                          fontSize: sixteen,
                        ),
                        trailing: Switch(
                            activeTrackColor: colorSplash,
                            activeColor: Colors.white,
                            inactiveThumbColor:
                                Colors.grey, // Change this color
                            value: item.isActive,
                            onChanged: (value) {
                              itemProvider.toggleSwitch(index);
                            }),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              text: "Daily",
                              right: five,
                              left: ten,
                              fontSize: twelve,
                              fontWeight: FontWeight.w300,
                            ),
                            Container(
                              color: Colors.grey.withOpacity(zero30),
                              width: one,
                              height: fifteen,
                            ),
                            CommonTextWidget(
                              left: ten,
                              fontSize: twelve,
                              fontWeight: FontWeight.w300,
                              text: "Medicine Name",
                            )
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
