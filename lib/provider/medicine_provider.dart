import 'package:flutter/cupertino.dart';

class Item {
  String name;
  bool isActive;

  Item({required this.name, this.isActive = false});
}

class MedicineProvider extends ChangeNotifier {
  final List<Item> _items = [
    Item(name: '08:00 PM'),
    Item(name: '10:00 PM'),
    Item(name: '03:00 PM'),
  ];

  List<Item> get items => _items;

  void toggleSwitch(int index) {
    _items[index].isActive = !_items[index].isActive;
    notifyListeners();
  }

//add data
  DateTime _selectedTime = DateTime.now();

  DateTime get selectedTime => _selectedTime;

  void updateTime(DateTime newTime) {
    _selectedTime = newTime;
    notifyListeners();
  }
}
