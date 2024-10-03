import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';

class QuizGraphTextWidget extends StatelessWidget {
  const QuizGraphTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildLegendItem(color1, 'Lorem Ipsum')),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: _buildLegendItem(color2, 'Lorem Ipsum')),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: _buildLegendItem(color3, 'Lorem Ipsum')),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: twenty,
                      height: twenty,
                      decoration: commonBoxDecoration(
                        shape: BoxShape.circle,
                        color: color4,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: ten,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      text: "Lorem ipsum",
                      fontSize: twelve,
                      textColor: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonTextWidget(
                      text: "Lorem ipsum",
                      fontSize: ten,
                      textColor: Colors.black.withOpacity(0.80),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: twenty,
                      height: twenty,
                      decoration: commonBoxDecoration(
                        shape: BoxShape.circle,
                        color: color3,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: ten,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidget(
                      text: "Lorem ipsum",
                      fontSize: twelve,
                      textColor: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonTextWidget(
                      text: "Lorem ipsum",
                      fontSize: ten,
                      textColor: Colors.black.withOpacity(0.80),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: twenty,
              height: twenty,
              decoration: commonBoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidget(
              text: text,
              fontSize: twelve,
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            CommonTextWidget(
              text: text,
              fontSize: ten,
              textColor: Colors.black.withOpacity(0.80),
            )
          ],
        )
      ],
    );
  }
}
