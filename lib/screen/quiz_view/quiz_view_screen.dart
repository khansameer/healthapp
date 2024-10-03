import 'package:flutter/material.dart';
import 'package:junohealthapp/core/app_constants.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/common_text_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/core/string/string_utils.dart';
import 'package:junohealthapp/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizViewScreen extends StatelessWidget {
  const QuizViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final quizProvider = Provider.of<QuizProvider>(context);
    final currentQuestion =
        quizProvider.questions[quizProvider.currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(title: healthQuiz),
      body: CommonsScreenContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * zero003,
            ),
            Align(
              alignment: Alignment.center,
              child: setAssetImage(image: icLogo, width: size.width * zero04),
            ),
            Align(
              alignment: Alignment.center,
              child: CommonTextWidget(
                top: ten,
                fontWeight: FontWeight.w700,
                fontSize: sixteen,
                text: healthQuiz,
              ),
            ),
            CommonTextWidget(
              top: size.height * zero004,
              text: currentQuestion.question,
            ),
            //const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: currentQuestion.options.length,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  dense: true,
                  visualDensity:
                      const VisualDensity(vertical: -2, horizontal: -4),
                  contentPadding: EdgeInsets.zero,
                  title: CommonTextWidget(text: currentQuestion.options[index]),
                  value: index,
                  groupValue: quizProvider
                      .selectedAnswers[quizProvider.currentQuestionIndex],
                  onChanged: (value) {
                    quizProvider.selectAnswer(value); // Update selected answer
                  },
                );
              },
            ),

            CommonButtonWidget(
              height: forty,
              padding: EdgeInsets.zero,
              top: size.height * zero002,
              onPressed: quizProvider
                          .selectedAnswers[quizProvider.currentQuestionIndex] !=
                      null
                  ? () => quizProvider
                      .nextQuestion(context) // Pass context to navigate
                  : null, // Disable button if no option is selected
              width: size.width * zero04,
              text: quizProvider.currentQuestionIndex ==
                      quizProvider.questions.length - 1
                  ? finish
                  : next,
            )
          ],
        ),
      ),
    );
  }
}
