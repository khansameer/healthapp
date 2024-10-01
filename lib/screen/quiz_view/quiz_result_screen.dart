import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/provider/quiz_provider.dart';

class QuizResultScreen extends StatelessWidget {
  final List<int?> selectedAnswers;
  final List<Question> questions;

  const QuizResultScreen(
      {required this.selectedAnswers, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(
        title: 'Quiz Result',
      ),
      body: CommonsScreenContainer(
        child: ListView(
          shrinkWrap: true,
          children: [
            // Pie chart
            SizedBox(
              width: 300, // Set desired width
              height: 300, // Set desired height
              child: PieChart(
                PieChartData(
                  titleSunbeamLayout: true,
                  pieTouchData: PieTouchData(enabled: true),
                  borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.green, width: five)),
                  startDegreeOffset: 10,
                  sectionsSpace: 0,
                  sections: _buildPieChartSections(),
                  centerSpaceRadius: 0,
                ),
              ),
            ),

            CommonTextWidget(
              text: 'Your Symptom checker is 90%',
              fontSize: eighteen,
              top: sixteen,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: sixteen),
            // Legend
            _buildLegend(),
            Align(
              alignment: Alignment.center,
              child: _buildLegend1(isShowTwoItem: true),
            ),
            const SizedBox(height: twentyFour),
            // List of items
            _buildItemList(),

          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.yellow,
        value: 30,
        radius: 120, // Increase the radius for a bigger pie slice
        title: '', // You can add a title if needed
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 20,
        radius: 120, // Adjust the radius for uniform size
        title: '',
      ),
      PieChartSectionData(
        color: Colors.grey,
        value: 30,
        radius: 120,
        title: '',
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: 10,
        radius: 120,
        title: '',
      ),
      PieChartSectionData(
        color: Colors.teal,
        value: 10,
        radius: 120,
        title: '',
      ),
    ];
  }

  // Legend for the pie chart
  Widget _buildLegend({bool isShowTwoItem = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildLegendItem(Colors.yellow, 'Lorem Ipsum')),
        Expanded(child: _buildLegendItem(Colors.yellow, 'Lorem Ipsum')),
        isShowTwoItem
            ? const SizedBox.shrink()
            : Expanded(child: _buildLegendItem(Colors.yellow, 'Lorem Ipsum')),
      ],
    );
  }

  Widget _buildLegend1({bool isShowTwoItem = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 7, child: _buildLegendItem(Colors.yellow, 'Lorem Ipsum')),
        Expanded(
            flex: 7, child: _buildLegendItem(Colors.yellow, 'Lorem Ipsum')),
        // isShowTwoItem?const SizedBox.shrink():Expanded(child: _buildLegendItem(Colors.yellow, 'Lorem Ipsum')),
      ],
    );
  }

  // Single legend item
  Widget _buildLegendItem(Color color, String text) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: twenty,
        height: twenty,
        decoration: commonBoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
      title: CommonTextWidget(
        text: text,
        fontSize: twelve,
        textColor: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      subtitle: CommonTextWidget(
        text: text,
        fontSize: ten,
        textColor: Colors.black.withOpacity(0.80),
      ),
    );
  }

  Widget _buildItemList() {
    return ListView(
      shrinkWrap: true,
      children: [
        _buildItem(Colors.yellow, 'Lorem ipsum dolor sit amet.'),
        _buildItem(Colors.purple, 'Lorem ipsum dolor sit amet.'),
        _buildItem(Colors.green, 'Lorem ipsum dolor sit amet.'),
        _buildItem(Colors.grey, 'Lorem ipsum dolor sit amet.'),
        _buildItem(Colors.grey, 'Lorem ipsum dolor sit amet.'),
      ],
    );
  }

// Single item in the list
  Widget _buildItem(Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: ten,
              decoration: commonBoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              height: ten,
            ),

            CustomPaint(
              size: Size(one,forty), // Use a specific height if needed
              painter: DottedDashPainter(),
            )
            /*Container(
              height: forty,
              width: one,
              color: Colors.grey,
            ),*/
          ],
        ),
        const SizedBox(width: fifteen),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(
                text: text,
                fontSize: sixteen,
                fontWeight: FontWeight.w600,
              ),
              CommonTextWidget(
                fontSize: twelve,
                top: five,
                text: text,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class DottedDashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.grey, Colors.grey], // Define your gradient colors here
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, 10, size.height));

    double dashWidth = 2; // Width of the dash
    double dashSpace = 2; // Space between dashes
    double startY = 0;

    while (startY < size.height) {
      canvas.drawRect(Rect.fromLTWH(0, startY, dashWidth, dashWidth), paint);
      startY += dashWidth + dashSpace; // Move down for the next dash
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
