import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpMethods {
  final String url =
      'https://us-central1-ashesisocial.cloudfunctions.net/ashesi_social_network_api';
  //SAVING PROFILE TO THE DATABASE
  Future<String> signUpUser({
    required String name,
    required String email,
    required String major,
    required String SID,
    required String DOB,
    required String year,
    required String bestFood,
    required String bestMovie,
    required String campusHousing,
    required String password,
  }) async {
    final http.Response profileAdd = await http.post(
      Uri.parse('${url}/profiles'),
      body: jsonEncode(
        <String, dynamic>{
          'name': name,
          "email": email,
          "SID": SID,
          "major": major,
          "DOB": DOB,
          "year": year,
          "bestFood": bestFood,
          "bestMovie": bestMovie,
          "campusHousing": campusHousing,
        },
      ),
    );

    String userValue = 'Some error occurred';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          SID.isNotEmpty ||
          major.isNotEmpty ||
          DOB.isNotEmpty ||
          year.isNotEmpty ||
          bestFood.isNotEmpty ||
          bestMovie.isNotEmpty ||
          campusHousing.isNotEmpty) {
        userValue = 'success';
      }
    } catch (err) {
      userValue = err.toString();
    }
    return userValue;
  }

//SAVING MESSAGE TO THE DATABASE
  Future<String> postMssg({
    // required String datetime,
    required String email,
    required String body,
  }) async {
    final http.Response addPost = await http.post(
      Uri.parse('${url}/posts'),
      body: jsonEncode(
        <String, dynamic>{
          "email": email,
          "body": body,
          "currenttime": DateTime.now().toString(),
        },
      ),
    );

    String mssgValue = 'Some error occurred';
    try {
      if (email.isNotEmpty || body.isNotEmpty) {
        mssgValue = 'success';
      }
    } catch (err) {
      mssgValue = err.toString();
    }
    return mssgValue;
  }

  // VIEW ALL POSTS
  Future<List<Map>> fetchMssgs() async {
    List<Map> mssgs = [];

    // Get all the data from the API
    http.Response response = await http.get(Uri.parse('${url}/posts'));

    if (response.statusCode == 200) {
      // get the data from the response
      String jsonMssgString = response.body;

      List mssg = jsonDecode(jsonMssgString);
      // Convert to ListMap
      mssgs = mssg.cast<Map>();
    }
    return mssgs;
  }

  // EDIT PROFILE METHOD
  Future<bool> updateProfile(
      Map<String, dynamic> profileData, String SID) async {
    bool status = false;

    // Update the profile
    http.Response response = await http.post(
      Uri.parse('${url}/profiles/update'),
      body: jsonEncode(profileData),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }
    return status;
  }

// VIEW PROFILE METHOD
  Future<Map> viewProfile(profileId) async {
    Map profile = {};

    // GET ONE DATA ITEM FROM THE API
    http.Response response =
        await http.get(Uri.parse('${url}/profiles?SID=$profileId'));

    if (response.statusCode == 200) {
      // get data from the response
      String jsonString = response.body;

      // convert to List<Map>
      profile = jsonDecode(jsonString);
    }
    return profile;
  }
}
