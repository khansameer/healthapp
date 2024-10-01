import 'package:flutter/cupertino.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';

class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

class QuizProvider extends ChangeNotifier {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers =
      List<int?>.filled(5, null); // Stores selected answers

  // List of questions with options
  List<Question> questions = [
    Question(
        'How often do you exercise?',
        ['Daily', '3-4 times a week', '1-2 times a week', 'Rarely or never'],
        0),
    Question(
        'How often do you exercise part2?',
        ['Daily', '3-4 times a week', '1-2 times a week', 'Rarely or never'],
        1),
    Question(
        'How often do you exercise part3?',
        ['Daily', '3-4 times a week', '1-2 times a week', 'Rarely or never'],
        2),
    Question(
        'How often do you exercise part 4?',
        ['Daily', '3-4 times a week', '1-2 times a week', 'Rarely or never'],
        2),
    Question(
        'How often do you exercise part 5?',
        ['Daily', '3-4 times a week', '1-2 times a week', 'Rarely or never'],
        0),
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
      pushScreen(context: context, routeName: RouteName.quizResultScreen);
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
