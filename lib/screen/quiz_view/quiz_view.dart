import 'package:flutter/material.dart';
import 'package:junohealthapp/core/common/common_button_widget.dart';
import 'package:junohealthapp/core/common/commons_screen_container.dart';
import 'package:junohealthapp/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizViewScreen extends StatelessWidget {
  const QuizViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    final quizProvider = Provider.of<QuizProvider>(context);
    final currentQuestion = quizProvider.questions[quizProvider.currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: CommonsScreenContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Text(
              'Question ${quizProvider.currentQuestionIndex + 1}/${quizProvider.questions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),*/
            //const SizedBox(height: 16),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 18),
            ),
            //const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: currentQuestion.options.length,
              itemBuilder: (context, index) {
                return RadioListTile<int>(
                  title: Text(currentQuestion.options[index]),
                  value: index,
                  groupValue: quizProvider.selectedAnswers[quizProvider.currentQuestionIndex],
                  onChanged: (value) {
                    quizProvider.selectAnswer(value); // Update selected answer
                  },
                );
              },
            ),


            CommonButtonWidget(
              onPressed: quizProvider.selectedAnswers[quizProvider.currentQuestionIndex] != null
                  ? () => quizProvider.nextQuestion(context) // Pass context to navigate
                  : null, // Disable button if no option is selected
              width: size.width*0.3,
             text:  quizProvider.currentQuestionIndex == quizProvider.questions.length - 1
                ? 'Finish'
                : 'Next',)
          ],
        ),
      ),
    );
  }
}
