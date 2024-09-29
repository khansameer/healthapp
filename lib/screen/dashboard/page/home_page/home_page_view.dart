import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_textfield.dart';

import 'package:junohealthapp/screen/dashboard/page/home_page/banner_view.dart';
import 'package:junohealthapp/screen/dashboard/page/home_page/category_view.dart';
import 'package:junohealthapp/screen/dashboard/page/home_page/quiz_view.dart';
import 'package:junohealthapp/screen/dashboard/page/home_page/top_news_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(twenty),
        child: ListView(
          shrinkWrap: true,
          children: [
            CommonTextField(
              iconWidget: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hint: "Search symptoms here...",
            ),
            const BannerView(),
            const CategoryView(),
            const QuizView(),
            const TopNewsView()
          ],
        ),
      ),
    );
  }
}
