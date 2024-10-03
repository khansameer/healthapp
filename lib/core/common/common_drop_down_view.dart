import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';

class CommonDropDownView extends StatelessWidget {
  const CommonDropDownView(
      {super.key,
      required this.size,
      this.hint,
      this.decoration,
      this.horizontal,
      this.onChanged,
      this.hintColor,
      this.height,
      required this.items,
      this.selectedValue});
  final Size size;
  final String? hint;
  final BoxDecoration? decoration;
  final Color? hintColor;
  final String? selectedValue;
  final double? height;
  final double? horizontal;
  final void Function(String?)? onChanged;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isDense: true,
        isExpanded: true,
        alignment: Alignment.center,
        hint: Row(
          children: [
            Expanded(
              child: CommonTextWidget(
                text: hint ?? 'Select Item',
                fontSize: twelve,
                left: twenty,
                textColor: hintColor ?? Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: CommonTextWidget(
                    text: item,
                    left: horizontal != null ? 0 : twenty,
                  ),
                ))
            .toList(),
        value: selectedValue,
        /*onChanged: (String? value) {
          */ /*setState(() {
                selectedValue = value;
              });*/ /*
        },*/
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          decoration: decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.30),
                ),
                //color: Colors.redAccent,
              ),
          padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0),
          height: height ?? 50,
          width: size.width * 0.7,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: height ?? 50,
        ),
      ),
    );
  }
}
