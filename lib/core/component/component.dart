import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_drop_down_view.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/shared_preferences/preference_helper.dart';

setAssetImage(
    {required String image, double? width, double? height, BoxFit? fit}) {
  return Image.asset(
    image,
    width: width,
    height: height,
    fit: fit ?? BoxFit.cover,
  );
}

BoxDecoration commonBoxDecoration(
    {Color? color,
    BoxBorder? border,
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
    DecorationImage? image}) {
  return BoxDecoration(
      color: color,
      image: image,
      border: border,
      shape: shape,
      borderRadius: borderRadius);
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
    String? Function(String?)? validator,
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
        colorFill: Colors.white,
        suffixIcon: suffixIcon,
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        radius: twelve,
        top: topTextField,
      )
    ],
  );
}

commonDropDownWithTextView(
    {String? title,
    double? topText,
    double? topDropDownValue,
    String? hint,
    required Size size,
    void Function(String?)? onChanged,
    String? selectedValue,
    required List<String> items}) {
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
      Container(
        width: size.width,
        margin: EdgeInsets.only(top: topDropDownValue ?? 0),
        child: CommonDropDownView(
            horizontal: 5,
            onChanged: onChanged,
            selectedValue: selectedValue,
            hint: hint,
            size: size,
            items: items),
      ),
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

pushScreen(
    {required BuildContext context,
    required String routeName,
    Object? arguments}) {
  Navigator.pushNamed(
      arguments: arguments,
      // Use the parent widget's context, not the local one
      Navigator.of(context, rootNavigator: true).context,
      routeName);
}

pushNamedAndRemoveUntil(
    {required BuildContext context, required String routeName}) {
  Navigator.pushNamedAndRemoveUntil(
      Navigator.of(context, rootNavigator: true).context,
      routeName,
      (route) => true);
}

void showCommonDialog(
    {required BuildContext context,
    required String title,
    required String content,
    String? btnPositive,
    String? btnNegative,
    bool isMessage = false,
    VoidCallback? onPressPositive,
    VoidCallback? onPressNegative}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: CommonTextWidget(
              text: title,
              fontSize: sixteen,
              fontWeight: FontWeight.w700,
            ),
            content: CommonTextWidget(text: content),
            actions: [
              if (!isMessage)
                CupertinoDialogAction(
                  onPressed: onPressNegative ??
                      () {
                        Navigator.of(context).pop();
                      },
                  child: CommonTextWidget(
                    text: btnNegative ?? no,
                  ),
                ),

              // Show only if isMessage is false
              CupertinoDialogAction(
                onPressed: onPressPositive ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: CommonTextWidget(
                  text: btnPositive ?? okay,
                  textColor: Colors.red,
                ),
              ),
            ],
          ));
}

Future getToken() async {
  String? token =
      await PreferenceHelper.getString(key: PreferenceHelper.authToken);

  print('=================token${token}');
  return token;
}

Widget showLoaderList() {
  return Center(
    child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(20),
        child: const CupertinoActivityIndicator(
          radius: 20,
          color: Colors.white,
          animating: true,
        )),
  );
}
