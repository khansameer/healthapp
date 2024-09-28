import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:junohealthapp/core/route/route.dart';

enum Gender { male, female }

class AuthProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool _isConfirmPasswordVisible = false;

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  String _pin = '';

  String get pin => _pin;

  void updatePin(String newPin) {
    _pin = newPin;
    notifyListeners();
  }

  void clearPin() {
    _pin = '';
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  Gender _selectedGender = Gender.male; // Default selection

  Gender get selectedGender => _selectedGender;

  void selectGender(Gender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  redirectToLogin({required BuildContext context}) {
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.login, (route) => false);
    });
  }
}
