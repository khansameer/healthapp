import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:provider/provider.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      Future.microtask(() {
        provider.loadBanner();
      });
      return Container(
        margin: EdgeInsets.only(top: size.height * zero002),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFC7ACF9), // Lighter purple tone
                Color(0xFF816CAB), // Darker purple tone
              ],
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
            ),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(twelve)),
        child: Column(
          children: [
            CarouselSlider(
              items: provider.listBanner.map((e) {
                return SizedBox(
                  height: size.height * zero004,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget(
                              text: e.title,
                              left: twenty,
                              fontSize: twenty,
                              fontWeight: FontWeight.w900,
                              textColor: Colors.white,
                            ),
                            CommonTextWidget(
                              text: e.desc,
                              top: ten,
                              left: twenty,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: setAssetImage(
                              fit: BoxFit.scaleDown,
                              width: twoHundred,
                              height: oneHundred,
                              image: icGirls))
                    ],
                  ),
                );
              }).toList(),
              carouselController: provider.controller,
              options: CarouselOptions(
                height: size.height * zero014,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  provider.setIndicatorIndex(index);
                },
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: twenty, top: five, bottom: five),
              child: Row(
                children: provider.listBanner.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => provider.controller.animateToPage(entry.key),
                    child: Container(
                      width: eight,
                      height: eight,
                      margin: const EdgeInsets.symmetric(
                          vertical: four, horizontal: four),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(
                                  provider.current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}
