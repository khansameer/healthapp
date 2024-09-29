import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:junohealthapp/core/image/image_path.dart';
import 'package:junohealthapp/provider/common_model.dart';

class DashboardProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int _current = 0;
  CarouselSliderController _controller = CarouselSliderController();
  CarouselSliderController get controller => _controller;
  int get selectedIndex => _selectedIndex;
  int get current => _current;

  List<CommonModel> _listBanner = [];
  List<CommonModel> get listBanner => _listBanner;

  //category List
  List<CommonModel> _listCategory = [];
  List<CommonModel> get listCategory => _listCategory;

  //Quiz List
  List<CommonModel> _listQuiz = [];
  List<CommonModel> get listQuiz => _listQuiz;

  //News  List
  List<CommonModel> _listNews = [];
  List<CommonModel> get listNews => _listNews;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setIndicatorIndex(int index) {
    _current = index;
    notifyListeners();
  }

  void loadBanner() {
    _listBanner = [
      CommonModel(
          title: "Clarification Of\nSymptoms",
          desc: "What symptoms troubling you today?",
          image: icGirls),
      CommonModel(
          title: "Clarification Of\nSymptoms",
          desc: "What symptoms troubling you today?",
          image: icGirls),
      CommonModel(
          title: "Clarification Of\nSymptoms",
          desc: "What symptoms troubling you today?",
          image: icGirls)
    ];
    notifyListeners(); // Notify listeners that the list has changed
  }

  void loadQuiz() {
    _listQuiz = [
      CommonModel(
          title: "Health Quiz",
          desc: "Take part in Health Care Challenges Quiz",
          image: icGirls),
      CommonModel(
          title: "Health Quiz1",
          desc: "Take part in Health Care Challenges Quiz",
          image: icGirls),
      CommonModel(
          title: "Health Quiz2",
          desc: "Take part in Health Care Challenges Quiz",
          image: icGirls),
    ];
    notifyListeners(); // Notify listeners that the list has changed
  }

  void loadCategory() {
    _listCategory = [
      CommonModel(title: "Symptom\nChecker", image: icCat),
      CommonModel(title: "Dr. Juno", image: icCat1),
      CommonModel(title: "Health Tips", image: icCat2),
      CommonModel(title: "Doctor\nFinder", image: icCat3),
      CommonModel(title: "Drug\nInteraction", image: icCat4),
      CommonModel(title: "Medicine\nReminder", image: icCat5),
      CommonModel(title: "My\nTherapist", image: icCat6),
      CommonModel(title: "Health\nGoal Box", image: icCat7),
    ];
    notifyListeners(); // Notify listeners that the list has changed
  }

  void loadNews() {
    _listNews = [
      CommonModel(
          title: "Minnesota reports rare\nhuman death from rabies",
          image: icNews1),
      CommonModel(
          title: "Billions worldwide lack\nadequate int...", image: icNews2),
      CommonModel(
          title: "Older Singaporeans\nvaccinated agai...", image: icNews3),
    ];
    notifyListeners(); // Notify listeners that the list has changed
  }
}
