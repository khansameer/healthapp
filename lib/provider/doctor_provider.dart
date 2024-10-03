import 'package:flutter/cupertino.dart';

class Doctor {
  final String name;

  Doctor(this.name);
}

class DoctorProvider extends ChangeNotifier {
  final List<Doctor> _doctors = [
    Doctor("Dr. Smith"),
    Doctor("Dr. Johnson"),
    Doctor("Dr. Brown"),
    Doctor("Dr. Garcia"),
    Doctor("Dr. Martinez"),
    Doctor("Dr. Lee"),
    Doctor("Dr. Wilson"),
    Doctor("Dr. Anderson"),
    Doctor("Dr. Thomas"),
    Doctor("Dr. White"),
  ];

  List<Doctor> get doctors => _doctors;
}
