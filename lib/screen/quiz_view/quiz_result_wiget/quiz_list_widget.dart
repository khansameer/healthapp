import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/component/component.dart';

class QuizListWidget extends StatelessWidget {
  const QuizListWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

  Widget _buildItem(Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: fifteen,
              decoration: commonBoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              height: fifteen,
            ),
            CustomPaint(
              size: const Size(one, forty), // Use a specific height if needed
              painter: DottedDashPainter(),
            )
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
