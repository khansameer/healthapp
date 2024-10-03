import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';

class QuizGraphWidget extends StatelessWidget {
  const QuizGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Set desired width
      height: 300, // Set desired height
      child: PieChart(
        PieChartData(
          titleSunbeamLayout: true,
          pieTouchData: PieTouchData(enabled: true),
          borderData: FlBorderData(
              show: true, border: Border.all(color: Colors.green, width: five)),
          startDegreeOffset: 10,
          sectionsSpace: 0,
          sections: _buildPieChartSections(),
          centerSpaceRadius: 0,
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
}
