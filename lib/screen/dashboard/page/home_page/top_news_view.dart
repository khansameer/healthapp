import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:junohealthapp/screen/tops_news/top_news_details.dart';
import 'package:provider/provider.dart';

class TopNewsView extends StatelessWidget {
  const TopNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      Future.microtask(() {
        provider.loadNews();
      });
      return Column(
        children: [
          SizedBox(
            height: size.height * zero002,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                fontWeight: FontWeight.w500,
                text: topNews.toUpperCase(),
              ),
              commonInkWell(
                onTap: () {
                  pushScreen(context: context, routeName: RouteName.topNewsDetails);
                },
                child: CommonTextWidget(
                  textColor: colorGreen,
                  fontWeight: FontWeight.w600,
                  text: seeAll.toString(),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * zero001,
          ),
          SizedBox(
            height: size.height * zero03,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: provider.listNews.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(ten),
                    child: Column(
                      children: [
                        setAssetImage(
                            fit: BoxFit.fill,
                            width: size.width * zero04,
                            height: size.height * zero015,
                            image: provider.listNews[index].image.toString()),
                        CommonTextWidget(
                          top: ten,
                          fontSize: twelve,
                          textAlign: TextAlign.center,
                          text: provider.listNews[index].title.toString(),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      );
    });
  }
}
