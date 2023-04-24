// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HttpAPIHelper {
//   // CREATE A NEW STUDENT PROFILE
//   Future<bool> createProfile(Map data) async {
//     bool status = false;

//     //GET DATA FROM THE API
//     http.Response response = await http.post(
//         Uri.parse(
//             'https://us-central1-ashesisocialnetwork.cloudfunctions.net/ashesi_social_network_api/profiles'),
//         body: jsonEncode(data),
//         headers: {'Content-type': 'application/json'});

//     if (response.statusCode == 201) {
//       status = response.body.isNotEmpty;
//     }
//     return status;
//   }
// }
