import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';

import 'package:junohealthapp/core/common/common_textfield.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/screen/dashboard/page/doctor/doctor_category_list.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(eight),
        child: ListView(
          shrinkWrap: true,
          children: [
            CommonTextField(
              iconWidget: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hint: searchHint,
            ),
            CommonTextField(
              top: fifteen,
              iconWidget: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hint: zipCode,
            ),
            SizedBox(
              height: size.height * zero002,
            ),
            const DoctorCategoryList(),
          ],
        ),
      ),
    );
  }
}
