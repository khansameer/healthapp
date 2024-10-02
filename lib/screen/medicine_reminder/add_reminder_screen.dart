import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_drop_down_view.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/medicine_provider.dart';
import 'package:provider/provider.dart';

class AddReminderScreen extends StatelessWidget {
  const AddReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<MedicineProvider>(context);
    var size = MediaQuery.sizeOf(context);
    String? selectedValue;
    return Scaffold(
      backgroundColor: colorBG,
      body: CommonsScreenContainer(
        color: colorBG,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: thirty,
                    )),
                CommonTextWidget(
                  fontSize: sixteen,
                  text: addReminder,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Colors.black,
                      size: thirty,
                    ))
              ],
            ),
            /* Text(
              'Selected Time: ${timeProvider.selectedTime.hour}:${timeProvider.selectedTime.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 24),
            ),*/
            const SizedBox(height: ten),
            SizedBox(
              height: size.height * zero03,
              width: size.width,
              child: CupertinoDatePicker(
                backgroundColor: colorBG,
                mode: CupertinoDatePickerMode.time,
                initialDateTime: timeProvider.selectedTime,
                onDateTimeChanged: (DateTime newTime) {
                  timeProvider.updateTime(newTime);
                },
              ),
            ),
            const SizedBox(
              height: forty,
            ),
            CommonDropDownView(
              size: size,
              horizontal: ten,
              height: sixty,
              decoration: commonBoxDecoration(
                  borderRadius: BorderRadius.circular(eight),
                  color: Colors.white),
              hintColor: colorBlack,
              hint: medicineName,
              items: ["items", "Item2"],
              selectedValue: selectedValue,
            ),
            const SizedBox(
              height: twenty,
            ),
            CommonDropDownView(
              size: size,
              horizontal: ten,
              height: sixty,
              decoration: commonBoxDecoration(
                  borderRadius: BorderRadius.circular(eight),
                  color: Colors.white),
              hintColor: colorBlack,
              hint: repeat,
              items: ["items", "Item2"],
              selectedValue: selectedValue,
            ),
            const SizedBox(
              height: twenty,
            ),
            Container(
              height: sixty,
              decoration: commonBoxDecoration(
                  borderRadius: BorderRadius.circular(eight),
                  color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    child: CommonTextWidget(
                      left: twenty,
                      text: label,
                    ),
                  ),
                  Expanded(
                      child: CommonTextField(
                    borderWidth: zero,
                    borderColor: Colors.white,
                    colorFill: Colors.transparent,
                    hint: "Enter Label",
                    right: ten,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
