import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/dashborad_provider.dart';
import 'package:provider/provider.dart';

class TopNewsDetails extends StatelessWidget {
  const TopNewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: zero,
            left: zero,
            right: zero,
            child: _image(size),
          ),
          Positioned.fill(
            top: size.height * zero02, // Adjust this based on the profile size
            child: _listview(size: size),
          ),
        ],
      ),
    );
  }

  _image(Size size) {
    return Stack(
      children: [
        setAssetImage(
            fit: BoxFit.fill,
            image: icTopNewsImage,
            width: size.width,
            height: size.height * zero0029),
        Positioned(
            top: zero,
            bottom: zero,
            left: zero,
            right: zero,
            child: Padding(
              padding: const EdgeInsets.all(twenty),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        fontSize: sixteen,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w700,
                        text: todayHealthNews,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: ten),
                        alignment: Alignment.topLeft,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    endIndent: zero,
                    indent: zero,
                    color: Colors.white,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CommonTextWidget(
                      textColor: Colors.white,
                      text: "Stay updated on your health",
                    ),
                  ),
                  const SizedBox(
                    height: twenty,
                  ),
                  Row(
                    children: [
                      setAssetImage(
                          fit: BoxFit.scaleDown,
                          image: icTopImg1,
                          width: twentyFour,
                          height: twentyFour),
                      const SizedBox(
                        width: fifteen,
                      ),
                      setAssetImage(
                          fit: BoxFit.scaleDown,
                          image: icTopImg2,
                          width: twentyFour,
                          height: twentyFour),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }

  _listview({required Size size}) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      Future.microtask(() {
        provider.loadTopNewsDetails();
      });
      return ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: size.width,
            height: size.height,
            child: ListView(
              children: [
                CommonTextWidget(
                  fontWeight: FontWeight.w700,
                  fontSize: eighteen,
                  text: recent,
                ),
                const SizedBox(
                  height: ten,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = provider.topNewsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(zero),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget(
                                    text: data.title,
                                    fontSize: thirteen,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextWidget(
                                        text: data.desc,
                                        top: five,
                                        fontSize: ten,
                                      ),
                                      CommonTextWidget(
                                        top: five,
                                        text: data.time,
                                        fontWeight: FontWeight.w600,
                                        fontSize: eleven,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          Expanded(
                            flex: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(ten),
                              child: setAssetImage(
                                  image: data.image.toString(),
                                  width: size.width * zero04,
                                  height: size.height * zero013,
                                  fit: BoxFit.fill),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: provider.topNewsList.length,
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
