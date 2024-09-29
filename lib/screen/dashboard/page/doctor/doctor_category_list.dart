import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:provider/provider.dart';

class DoctorCategoryList extends StatelessWidget {
  const DoctorCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      Future.microtask(() {
        provider.loadDoctorList();
      });
      return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        itemCount: provider.doctorList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: Colors.grey.withOpacity(zero20), width: one),
              borderRadius: BorderRadius.circular(zero), //border corner radius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                setAssetImage(
                    image: provider.doctorList[index].image.toString(),
                    width: forty,
                    height: forty,
                    fit: BoxFit.scaleDown),
                CommonTextWidget(
                  top: five,
                  fontSize: twelve,
                  textAlign: TextAlign.center,
                  text: provider.doctorList[index].title,
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
