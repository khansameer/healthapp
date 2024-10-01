import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/color_utils.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_result_wiget/quiz_graph_text_widget.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_result_wiget/quiz_graph_widget.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_result_wiget/quiz_list_widget.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(
        title: quizResult,
      ),
      body: CommonsScreenContainer(
        child: ListView(
          shrinkWrap: true,
          children: [
            // Pie chart
            const QuizGraphWidget(),

            Align(
              alignment: Alignment.center,
              child: CommonTextWidget(
                text: resultValue,
                fontSize: sixteen,
                top: zero,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: sixteen),
            // Legend
            //_buildLegend(),
            const SizedBox(
              height: twenty,
            ),
            const QuizGraphTextWidget(),

            SizedBox(height: size.height * zero005),
            // List of items
            const QuizListWidget(),
          ],
        ),
      ),
    );
  }
}
