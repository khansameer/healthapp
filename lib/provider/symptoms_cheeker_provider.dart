import 'package:flutter/cupertino.dart';
import 'package:junohealthapp/core/component/component.dart';
import 'package:junohealthapp/core/route/route.dart';

class SubItem {
  final String name;
  bool isSelected; // Tracks whether this item is selected

  SubItem(this.name, {this.isSelected = false});
}

class Category {
  final String name;
  final List<SubItem> subItems;

  Category(this.name, this.subItems);
}

class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

class SymptomsCheekerProvider extends ChangeNotifier {
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
      pushScreen(
          context: context,
          routeName: RouteName.symptomsCheckerViewDetailsScreen);
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

  List<String> bodyPartList = [
    "All Had Sysmptoms",
    "Back of head",
    "Scalp",
    "Forehead",
    "Eyes",
    "Nose",
    "Face",
    "Mouth",
    "Jaw",
    "Ears"
  ];

  ////view 2

  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<Category> _categories = [
    Category("Commom", [
      SubItem("Headache in back of head"),
      SubItem("Headache in back of head1"),
      SubItem("Headache in back of head 2"),
    ]),
    Category("All", [
      SubItem("Headache in back of head 3"),
      SubItem("Headache in back of head 4"),
      SubItem("Headache in back of head 5"),
    ]),
  ];

  List<Category> get categories => _categories;

  // Select a sub-item within a category and unselect all others
  void selectSubItem(Category category, SubItem subItem) {
    // Unselect all items in the category
    for (var item in category.subItems) {
      item.isSelected = false;
    }
    // Select the clicked item
    subItem.isSelected = true;
    notifyListeners(); // Notify listeners that the state has changed
  }
}
