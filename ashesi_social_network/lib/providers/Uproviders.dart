// import 'package:flutter/material.dart';
// import 'package:webtech_flutter_app/models/users.dart';
// import 'package:webtech_flutter_app/resources/auth_methods.dart';

// class ProUser with ChangeNotifier {
//   final AuthMethods _authMethods = AuthMethods();

//   UserInfo? _user;

//   UserInfo get getUserInfo => _user!;

//   Future<void> regetUser() async {
//     UserInfo user = await _authMethods.getUserDetails();
//     _user = user;
//     notifyListeners();
//   }
// }
