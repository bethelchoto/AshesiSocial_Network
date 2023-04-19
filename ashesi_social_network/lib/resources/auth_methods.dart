import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webtech_flutter_app/resources/storage_methods.dart';
import 'package:webtech_flutter_app/models/users.dart' as model;
import 'package:http/http.dart' as http;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // function to get the user details
  // Future<model.UserInfo> getUserDetails() async {
  //   User currentUser = _auth.currentUser!;

  //   DocumentSnapshot docSnap =
  //       await _firestore.collection('users').doc(currentUser.uid).get();

  //   return model.UserInfo.fromSnap(docSnap);
  // }

  // sign up user
  Future<String> signUpUser({
    required String username,
    required String email,
    required String major,
    required String SID,
    required String dob,
    required String yrGroup,
    required String bestFood,
    required String bestMovie,
    required String campusHousing,
    // required Uint8List file,
    required String password,
  }) async {
    final http.Response api_response = await http.post(
      Uri.parse(
          'https://us-central1-ashesisocialnetwork.cloudfunctions.net/ashesi_social_network_api/profiles'),
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          "email": email,
          "SID": SID,
          "major": major,
          "dob": dob,
          "yrGroup": yrGroup,
          "bestFood": bestFood,
          "bestMovie": bestMovie,
          "campusHousing": campusHousing,
          // "file": file,
        },
      ),
    );

    String val = 'Some error occurred';

    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              username.isNotEmpty ||
              SID.isNotEmpty ||
              major.isNotEmpty ||
              dob.isNotEmpty ||
              yrGroup.isNotEmpty ||
              bestFood.isNotEmpty ||
              bestMovie.isNotEmpty ||
              campusHousing.isNotEmpty
          // ||
          // file != null
          ) {
        //register user

        // UserCredential userDetails = await _auth.createUserWithEmailAndPassword(
        //     email: email, password: password);

        // String photoURL =
        //     await StorageData().uploadImgToFirebase('profilePics', file, false);

        // MUST BE REMOVED WAS USED TO INSERT DATA INTO FIREBASE USING THE FIREBASE METHODS
        // create a user model
        // model.UserInfo user = model.UserInfo(
        //   username: username,
        //   email: email,
        //   studentID: studentID,
        //   uid: userDetails.user!.uid,
        //   major: major,
        //   dob: dob,
        //   yrGroup: yrGroup,
        //   bestFood: bestFood,
        //   bestMovie: bestMovie,
        //   campusHousing: campusHousing,
        //   photoURL: photoURL,
        // );

        // add user to our database
        // await _firestore.collection('users').doc(userDetails.user!.uid).set(
        //       user.formateJson(),
        //     );

        val = 'success';
      }
    } catch (err) {
      val = err.toString();
    }
    return val;
  }

  // User Login
  // Future<String> userLogin({
  //   required String email,
  //   required String password,
  // }) async {
  //   String val = 'Error Occurred';
  //   try {
  //     if (email.isNotEmpty || password.isNotEmpty) {
  //       await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       val = 'success';
  //     } else {
  //       val = "Please enter the missing fields";
  //     }
  //   } catch (err) {
  //     val = err.toString();
  //   }
  //   return val;
  // }
}
