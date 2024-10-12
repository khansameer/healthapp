import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junohealthapp/core/route/route.dart';
import 'package:junohealthapp/firebase/firebase_service.dart';
import 'package:junohealthapp/screen/authentication/login/login_screen.dart';
import 'package:junohealthapp/screen/authentication/model/register_model.dart';
import 'package:junohealthapp/screen/dashboard/dashboard_screen.dart';
import 'package:junohealthapp/service/api_config.dart';
import 'package:junohealthapp/shared_preferences/preference_helper.dart';

import '../main.dart';
import '../service/api_services.dart';

enum Gender { male, female }

class AuthProviders extends ChangeNotifier {
  final _service = ApiService();
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool _isConfirmPasswordVisible = false;

  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  String _pin = '';

  String get pin => _pin;

  final _tetName = TextEditingController();
  final _tetUserName = TextEditingController();
  final _tetEmail = TextEditingController();
  final _tetPassword = TextEditingController();
  TextEditingController get tetName => _tetName;
  TextEditingController get tetUserName => _tetUserName;
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
      if (await PreferenceHelper.getBool(key: PreferenceHelper.isLOGIN) ==
          true) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.dashboardScreen, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.loginScreen, (route) => false);
      }
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

  Future<bool> checkUser({String? email, String? password}) async {
    _isFetching = true;
    notifyListeners();
    final querySnapshot = await FirebaseFirestore.instance
        .collection('loginUser')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future login(BuildContext context) async {
    bool exists =
        await checkUser(email: tetEmail.text, password: tetPassword.text);
    if (exists) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('loginUser')
          .where('email', isEqualTo: tetEmail.text)
          .where('password', isEqualTo: tetPassword.text)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          //  String documentId = doc.id;
          Map<String, dynamic> userDetails = doc.data() as Map<String, dynamic>;
          String documentId = doc.id; // Get the document ID
          print('User ID: $documentId');
          print('User Details: $userDetails');
          print('Document ID: $documentId');
          PreferenceHelper.setString(
              key: PreferenceHelper.userID, value: documentId ?? '');
          PreferenceHelper.setString(
              key: PreferenceHelper.userName,
              value: userDetails['username'] ?? '');
          PreferenceHelper.setString(
              key: PreferenceHelper.email, value: tetEmail.text ?? '');
          PreferenceHelper.setBool(key: PreferenceHelper.isLOGIN, value: true);

          updateToken();
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) => const DashboardScreen(),
            ),
            (route) => false,
          );
        });
      } else {
        print('No matching documents found');
      }

      _isFetching = true;
      PreferenceHelper.setString(
          key: PreferenceHelper.email, value: tetEmail.text ?? '');
      PreferenceHelper.setBool(key: PreferenceHelper.isLOGIN, value: true);

      /*updateToken();
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const DashboardScreen(),
        ),
        (route) => false,
      );*/
      _isFetching = false;
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error"),
        ),
      );

      _isFetching = false;
      notifyListeners();
    }
    _isFetching = false;
    notifyListeners();
    return exists;
  }

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  Future<bool> checkDuplicateEmail(
      {required String collectionName,
      required String field,
      required String value}) async {
    QuerySnapshot query = await fireStore
        .collection("users")
        .where(field, isEqualTo: value)
        .limit(1) // We only need to check if at least one document exists
        .get();

    return query.docs.isNotEmpty;
  }

  Future<List<DocumentSnapshot>> getUserList() async {
    String? email =
        await PreferenceHelper.getString(key: PreferenceHelper.email);

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("loginUser").get();

    List<DocumentSnapshot> userList = querySnapshot.docs;

    List<DocumentSnapshot> filteredUserList = userList.where((doc) {
      return doc['email'] != email;
    }).toList();

    return filteredUserList;
  }

  Future<bool> addNewUsers(BuildContext context) async {
    _isFetching = true;
    notifyListeners();

    bool exists = await checkDuplicateEmail(
        collectionName: "loginUser",
        field: "email",
        value: tetEmail.text ?? '');

    if (!exists) {
      try {
        String? token = await FirebaseMessaging.instance.getToken();

        CollectionReference chatsRef =
            FirebaseFirestore.instance.collection("loginUser");
        DocumentReference result = await chatsRef.add({
          "name": tetName.text,
          "email": tetEmail.text,
          'username': tetUserName.text,
          'password': tetPassword.text,
          'token': token,
          "createdAt": FieldValue.serverTimestamp(),
        });

        _isFetching = false;
        notifyListeners();

        if (result.id.isNotEmpty) {
          // User added successfully

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User added successfully!"),
            ),
          );

          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) => const LoginScreen(),
            ),
            (route) => false,
          );

          tetEmail.clear();
          tetPassword.clear();
          tetName.clear();
          tetUserName.clear();

          return true;
        }
      } catch (e) {
        // Error handling
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to add user: $e"),
          ),
        );
      } finally {
        _isFetching = false;
        notifyListeners();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email already exists"),
        ),
      );
      _isFetching = false;
      notifyListeners();
    }

    return false; // User not added
  }

  Future<void> updateToken() async {
    try {
      // Get a reference to Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('loginUser') // Replace 'users' with your collection name
          .where('email', isEqualTo: tetEmail.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        String docId = documentSnapshot.id;
        String? token = await FirebaseMessaging.instance.getToken();
        await firestore.collection('loginUser').doc(docId).update({
          'token': token,
          "createdAt": FieldValue.serverTimestamp(),
        });

        print('Record updated successfully!');
      } else {
        print('No record found with that email.');
      }
    } catch (e) {
      print('Failed to update record: $e');
    }
  }
}

class User {
  final String name;
  final String username;
  final String photoUrl;

  User({required this.name, required this.username, required this.photoUrl});
}
