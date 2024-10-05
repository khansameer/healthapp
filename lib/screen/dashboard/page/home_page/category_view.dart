import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      Future.microtask(() {
        provider.loadCategory();
      });
      return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        itemCount: provider.listCategory.length,
        itemBuilder: (context, index) {
          return Container(
            //color: Colors.white,
            margin: const EdgeInsets.only(top: twenty, left: ten, right: ten),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(twelve), //border corner radius
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 8)
                // BoxShadow(
                //   color: colorBG,
                //   spreadRadius: 10,
                //   blurRadius: 7,
                //   offset: Offset(0, 2),
                // ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                setAssetImage(
                    image: provider.listCategory[index].image.toString(),
                    width: forty,
                    height: forty,
                    fit: BoxFit.scaleDown),
                CommonTextWidget(
                  top: five,
                  fontSize: twelve,
                  textAlign: TextAlign.center,
                  text: provider.listCategory[index].title,
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
