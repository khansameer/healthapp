import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:junohealthapp/screen/dashboard/dashboard_screen.dart';
import 'package:junohealthapp/screen/dashboard/page/home_page/home_page_view.dart';
import 'package:junohealthapp/screen/dashboard/page/profile/profile_page_view.dart';
import 'package:provider/provider.dart';

import '../../screen/dashboard/page/doctor/doctor_view.dart';
import '../../screen/doctor_list_page.dart';

class CommonAppScaffoldView extends StatelessWidget {
  const CommonAppScaffoldView(
      {super.key,
      this.child,
      this.bottomNavigationBar,
      this.appbar,
      this.colorBg});

  final Widget? child;
  final Color? colorBg;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBg ?? Colors.white,
        appBar: appbar ?? commonAppBar(),
        body: child ??
            Consumer<DashboardProvider>(
              builder: (context, provider, child) {
                switch (provider.selectedIndex) {
                  case 0:
                    return const HomePageView();
                  case 1:
                    return const DoctorView();
                  case 2:
                    return  DoctorListPage();
                  case 3:
                    return const ProfilePageView();

                  default:
                    return const Text('Home');
                }
              },
            ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(thirty),
            topRight: Radius.circular(thirty),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            backgroundColor: colorFillBg,
            currentIndex: context.watch<DashboardProvider>().selectedIndex,
            onTap: (index) {
              context.read<DashboardProvider>().setIndex(index);
            },
            selectedItemColor: colorGreen,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: commonTextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: commonTextStyle(fontWeight: FontWeight.w500),
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              commonItem(text: home, image: icHome),
              commonItem(text: home, image: icHome),
              commonItem(text: "Doctor list", image: icMedicine),
              commonItem(text: doctor, image: icDoctor),

              commonItem(text: profile, image: icProfile),
            ],
          ),
        ));
  }

  commonItem({required String text, required String image}) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(image),
        size: twenty,
      ),
      label: text,
    );
  }
}
