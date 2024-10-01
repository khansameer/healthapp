import 'package:flutter/material.dart';
import 'package:junohealthapp/provider/quiz_provider.dart';
import 'package:junohealthapp/screen/quiz_view/quiz_view.dart';

class QuizResultScreen extends StatelessWidget {
  final List<int?> selectedAnswers;
  final List<Question> questions;

  QuizResultScreen({required this.selectedAnswers, required this.questions});

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Your Score: $score/${questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Go back to the quiz page and reset the quiz
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizViewScreen()),
                );
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to calculate the score
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        score++;
      }
    }
    return score;
  }
}
