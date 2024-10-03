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

  //News  List
  List<CommonModel> _doctorList = [];
  List<CommonModel> get doctorList => _doctorList;

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
          subDesc: "Take Quiz",
          title: "Health Quiz",
          desc: "Take part in Health Care Challenges Quiz",
          image: icGirls),
      CommonModel(
          subDesc: "Chat",
          title: "Juno's AI Doctor\nAssistant:",
          desc: "Take part in Health Care Challenges Quiz",
          image: icGirls),
      CommonModel(
          subDesc: "Set Goal",
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

  void loadDoctorList() {
    _doctorList = [
      CommonModel(title: "General Practice", image: icCat),
      CommonModel(title: "Pediatrics", image: icCat1),
      CommonModel(title: "Cardiology", image: icCat2),
      CommonModel(title: "Dermatology", image: icCat3),
      CommonModel(title: "Endocrinology", image: icCat4),
      CommonModel(title: "Gastroenterology", image: icCat5),
      CommonModel(title: "Geriatrics", image: icCat6),
      CommonModel(title: "Hematology", image: icCat7),
      CommonModel(title: "Infectious\nDisease", image: icCat),
      CommonModel(title: "Nephrology", image: icCat2),
      CommonModel(title: "Neurology", image: icCat3),
      CommonModel(title: "Obstetrics and\nGynecology", image: icCat4),
      CommonModel(title: "Oncology", image: icCat5),
      CommonModel(title: "Ophthalmology", image: icCat7),
      CommonModel(title: "Orthopedics", image: icCat7),
    ];
    notifyListeners(); // Notify listeners that the list has changed
  }

  //load topNews Detsils

  List<CommonModel> _topNewsList = [];
  List<CommonModel> get topNewsList => _topNewsList;
  void loadTopNewsDetails() {
    _topNewsList = [
      CommonModel(
          image: icTopNewItem,
          time: "54 minutes ago",
          title: "Older Singaporeans\nvaccinated agai...",
          desc:
              "SINGAPORE - Most older Singaporeanswho \nwere born in or before 1980 and\nwere vaccina..."),
      CommonModel(
          time: "54 minutes ago",
          title: "Older Singaporeans\nvaccinated agai...",
          desc:
              "SINGAPORE - Most older Singaporeanswho\nwere born in or before 1980 and\nwere vaccina...",
          image: icTopNewItem),
      CommonModel(
          time: "54 minutes ago",
          title: "Older Singaporeans\nvaccinated agai...",
          desc:
              "SINGAPORE - Most older Singaporeanswho\nwere born in or before 1980 and\nwere vaccina...",
          image: icTopNewItem),
      CommonModel(
          time: "54 minutes ago",
          title: "Older Singaporeans\nvaccinated agai...",
          desc:
              "SINGAPORE - Most older Singaporeanswho\nwere born in or before 1980 and\nwere vaccina...",
          image: icTopNewItem),
    ];
    notifyListeners(); // Notify listeners that the list has changed
  }
}
