import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:junohealthapp/screen/chat_screen/chat_screen.dart';
import 'package:provider/provider.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      Future.microtask(() {
        provider.loadQuiz();
      });
      return Container(
        margin: EdgeInsets.only(top: size.height * zero002),
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.fill, image: AssetImage(icQuizBg)),
            borderRadius: BorderRadius.circular(twelve)),
        child: Column(
          children: [
            CarouselSlider(
              items: provider.listQuiz.map((e) {
                return SizedBox(
                  height: size.height * zero004,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.only(left: twenty),
                          child: setAssetImage(
                              fit: BoxFit.cover,
                              image: icQuizUser,
                              width: ninety,
                              height: ninety),
                        ),
                      ),
                      Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonTextWidget(
                                text: e.title,
                                fontSize: twenty,
                                fontWeight: FontWeight.w800,
                                textColor: Colors.black,
                              ),
                              CommonTextWidget(
                                text: e.desc,
                                fontSize: eleven,
                                top: ten,
                                textColor: Colors.black,
                              ),
                              CommonButtonWidget(
                                width: size.width * zero32,
                                top: ten,
                                padding: EdgeInsets.zero,
                                height: thirty,
                                fontWeight: FontWeight.w500,
                                colorText: Colors.black,
                                onPressed: () {
                                  pushScreen(context: context,routeName:RouteName.chatScreen );

                                },
                                colorButton: colorYellow,
                                text: e.subDesc,
                              )
                            ],
                          ))
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
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      );
    });
  }
}
