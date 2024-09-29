import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';

setAssetImage(
    {required String image, double? width, double? height, BoxFit? fit}) {
  return Image.asset(
    image,
    width: width,
    height: height,
    fit: fit ?? BoxFit.cover,
  );
}

commonTextStyle({FontWeight? fontWeight, double? fontSize, Color? color}) {
  return GoogleFonts.inter(
    color: color,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
  );
}

commonTextFiledView(
    {String? title,
    bool? obscureText,
    double? topText,
    String? hint,
    double? topTextField,
    Widget? suffixIcon,
    TextEditingController? controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonTextWidget(
        text: title,
        top: topText,
        fontWeight: FontWeight.w500,
        textColor: Colors.black,
      ),
      CommonTextField(
        hint: hint,
        suffixIcon: suffixIcon,
        obscureText: obscureText,
        controller: controller,
        radius: twelve,
        top: topTextField,
      )
    ],
  );
}

commonDivider() {
  return Divider(
    thickness: 0.3,
    color: Colors.grey,
  );
}

Widget commonInkWell({
  Widget? child,
  VoidCallback? onTap,
}) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: onTap,
    child: child,
  );
}

AppBar commonAppBar(
    {String? title, Color? color, List<Widget>? actions, Color? colorText}) {
  return AppBar(
    backgroundColor: color ?? colorWhite,
    centerTitle: false,
    actions: actions,
    title: CommonTextWidget(
      text: title,
      fontSize: sixteen,
      fontWeight: FontWeight.w500,
      textColor: Colors.black,
    ),
  );
}

showMessageDialog(
    {required BuildContext context,
    String? title,
    String? content,
    Widget? child,
    Color? colorContextText,
    bool isNegative = false,
    String? positiveBtnText,
    VoidCallback? onTapClose,
    String? negativeBtnText}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setstate) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(twenty),
            ),
            title: CommonTextWidget(
              text: title.toString(),
              fontSize: sixteen,
              textColor: Colors.black,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
            ),
            content: child ??
                CommonTextWidget(
                  textColor: Colors.black,
                  text: content.toString(),
                  textAlign: TextAlign.center,
                ),
            actions: [
              CommonButtonWidget(
                onPressed: onTapClose ??
                    () {
                      Navigator.pop(context);
                    },
                text: negativeBtnText ?? 'close',
              )
            ],
          );
        });
      });
}

void showAlertDialog(
    {required BuildContext context, required VoidCallback onTap}) {
  // Define the content of the alert dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert Dialog Title'),
        content: Text('This is the content of the alert dialog.'),
        actions: [
          CommonButtonWidget(
            onPressed: onTap,
            text: "Okay",
          )
          /* TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false);
            },
            child: Text('Close'),
          ),*/
        ],
      );
    },
  );
}
