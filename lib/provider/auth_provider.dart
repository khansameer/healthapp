import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/screen/authentication/model/register_model.dart';
import 'package:junohealthapp/service/api_config.dart';
import 'package:junohealthapp/shared_preferences/preference_helper.dart';

import '../service/api_services.dart';

enum Gender { male, female }

class AuthProvider extends ChangeNotifier {
  final _service = ApiService();
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool _isConfirmPasswordVisible = false;

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  String _pin = '';

  String get pin => _pin;

  final _tetEmail = TextEditingController();
  final _tetPassword = TextEditingController();
  TextEditingController get tetEmail => _tetEmail;
  TextEditingController get tetPassword => _tetPassword;

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
          context, RouteName.loginScreen, (route) => false);
    });
  }

  String? _selectedValue;
  String? get selectedValue => _selectedValue;
  set selectionValue(String newPin) {
    _selectedValue = newPin;
    notifyListeners();
  }

  final List<String> _ageNumbers = [
    "18",
    "25",
    "32",
    "40",
    "50"
  ]; // Dummy age numbers

  List<String> get ageNumbers => _ageNumbers;

  // height
  final List<String> _height = [
    "160 cm",
    "170 cm",
    "180 cm",
    "190 cm",
    "200 cm"
  ]; // Dummy age numbers

  List<String> get height => _height;

  String? _selectedValueHeight;
  String? get selectedValueHeight => _selectedValueHeight;
  set selectionValueHeightValue(String newPin) {
    _selectedValueHeight = newPin;
    notifyListeners();
  }
  // for weight

  final List<String> _weight = [
    "50 kg",
    "80 kg",
    "90 kg",
    "100 kg",
    "110 kg"
  ]; // Dummy age numbers

  List<String> get weight => _weight;

  String? _selectedValueWight;
  String? get selectedValueWight => _selectedValueWight;
  set selectionValueWeightValue(String newPin) {
    _selectedValueWight = newPin;
    notifyListeners();
  }

  RegisterModel? _registerModel;

  RegisterModel? get registerModel => _registerModel;

  Future<void> registerAndLoginAPI(
      {required BuildContext context,
      required Map<String, dynamic> body,
      required bool isLogin}) async {
    _isFetching = true;
    notifyListeners();
    try {
      final response = await _service.callPostMethodApi(
          url: isLogin ? ApiConfig.login : ApiConfig.registerUser, body: body);
      _registerModel = RegisterModel.fromJson(json.decode(response));

      if (_registerModel?.userId != null && _registerModel?.token != null) {
        await PreferenceHelper.setString(
            key: PreferenceHelper.authToken, value: '${_registerModel?.token}');
        await PreferenceHelper.setString(
            key: PreferenceHelper.userID, value: '${_registerModel?.userId}');
        await PreferenceHelper.setBool(
            key: PreferenceHelper.isLOGIN, value: true);
      } else {
        print('=====fai error');
      }
    } catch (e) {
      // showDialog(context: context,);
      print('=====fail ${e.toString()}');
      // _registerModel = RegisterModel(message: 'server_error'.tr());
    }
    _isFetching = false;
    notifyListeners();
  }
}
