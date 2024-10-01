import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart.';
import 'package:junohealthapp/screen/quiz_view/quiz_result_screen.dart';
class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}
class QuizProvider extends ChangeNotifier{
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = List<int?>.filled(5, null); // Stores selected answers

  // List of questions with options
  List<Question> questions = [
    Question('What is the capital of France?', ['Paris', 'Berlin', 'Madrid', 'Rome'], 0),
    Question('What is 2 + 2?', ['3', '4', '5', '6'], 1),
    Question('Who wrote "Hamlet"?', ['Shakespeare', 'Tolstoy', 'Homer', 'Dante'], 0),
    Question('What is the square root of 16?', ['2', '3', '4', '5'], 2),
    Question('What is the boiling point of water?', ['50°C', '100°C', '150°C', '200°C'], 1),
  ];

  // Method to update selected answer
  void selectAnswer(int? selectedOption) {
    selectedAnswers[currentQuestionIndex] = selectedOption;
    notifyListeners();
  }

  // Method to go to the next question
  void nextQuestion(BuildContext context) {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultScreen(
            selectedAnswers: selectedAnswers,
            questions: questions,
          ),
        ),
      );
      // If last question, reset quiz
      //resetQuiz();
    }
    notifyListeners();
  }

  // Reset quiz
  void resetQuiz() {
    currentQuestionIndex = 0;
    selectedAnswers = List<int?>.filled(5, null);
    notifyListeners();
  }
}