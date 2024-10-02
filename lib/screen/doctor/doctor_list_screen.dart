import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/doctor_provider.dart';
import 'package:provider/provider.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: allDoctor),
      body: Consumer<DoctorProvider>(
        builder: (context, doctorProvider, child) {
          return ListView.separated(
            itemCount: doctorProvider.doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctorProvider.doctors[index];
              return ListTile(
                dense: true,
                leading: Container(
                  width: forty,
                  height: forty,
                  decoration: commonBoxDecoration(
                      shape: BoxShape.circle, color: colorGreen),
                  child: Center(
                    child: CommonTextWidget(
                      textColor: Colors.white,
                      fontWeight: FontWeight.w800,
                      text: doctor.name[0],
                    ),
                  ),
                ),
                title: CommonTextWidget(
                  text: doctor.name,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: zero05,
              );
            },
          );
        },
      ),
    );
  }
}
