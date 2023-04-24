// import 'package:flutter/material.dart';
// import 'package:webtech_flutter_app/utils/colors.dart';
// import 'package:webtech_flutter_app/utils/global.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<User> fetchUser() async {
//   const String postURL =
//       "https://us-central1-ashesisocialnetwork.cloudfunctions.net/ashesi_social_network_api/profiles?SID=28822024";

//   final response = await http.get(Uri.parse(postURL));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class User {
//   final String username;
//   final String email;
//   final int SID;
//   final String major;
//   final String dob;
//   final String yrGroup;
//   final String bestFood;
//   final String bestMovie;
//   final String campusHousing;
//   // final String photoURL;

//   const User({
//     required this.username,
//     required this.email,
//     required this.SID,
//     required this.major,
//     required this.dob,
//     required this.yrGroup,
//     required this.bestFood,
//     required this.bestMovie,
//     required this.campusHousing,
//     // required this.photoURL,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       username: json['name'],
//       email: json['email'],
//       SID: json['SID'],
//       major: json['major'],
//       dob: json['DOB'],
//       yrGroup: json['year'],
//       bestFood: json['bestFood'],
//       bestMovie: json['bestMovie'],
//       campusHousing: json['campusHousing'],
//       // 'photoURL': photoURL,
//     );
//   }
// }

// class profileScreen extends StatefulWidget {
//   const profileScreen({super.key});

//   @override
//   State<profileScreen> createState() => _profileScreenState();
// }

// class _profileScreenState extends State<profileScreen> {
//   bool _isLoad = false;
//   late Future<User> futureUser;

//   @override
//   void initState() {
//     super.initState();
//     futureUser = fetchUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('STUDENT PROFILE'),
//         backgroundColor: backgroundColor,
//       ),
//       backgroundColor: backgroundColor,
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(
//             (MediaQuery.of(context).size.width - 600) / 3,
//             30.0,
//             (MediaQuery.of(context).size.width - 600) / 3,
//             0),
//         child: Column(
//           children: [
//             const ListTile(
//               subtitle: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Type the id to search for: ",
//                   suffixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: primaryColor),
//                   ),
//                 ),
//                 keyboardType: TextInputType.text,
//               ),
//             ),

//             sizeBoxed,
//             Stack(
//               children: const [
//                 CircleAvatar(
//                   radius: 45,
//                   backgroundImage: NetworkImage('assets/avatar.png'),
//                 ),
//               ],
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student Name: " '${snapshot.data!.username}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student Email: " '${snapshot.data!.email}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student ID: " '${snapshot.data!.SID}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student Major: " '${snapshot.data!.major}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student DOB: " '${snapshot.data!.dob}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Year Group: " '${snapshot.data!.yrGroup}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student Best Food: "
//                                   '${snapshot.data!.bestFood}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Student Best Movie: "
//                                   '${snapshot.data!.bestMovie}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FutureBuilder<User>(
//                         future: futureUser,
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasData) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   "Campus Housing: "
//                                   '${snapshot.data!.campusHousing}',
//                                   style: myTextStyle,
//                                 ),
//                               );
//                             } else {
//                               return ListTile(
//                                 title: const Text('Error'),
//                                 subtitle: Text('${snapshot.error}'),
//                               );
//                             }
//                           } else {
//                             return const CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // button login
//             Padding(
//               padding: const EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 0),
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   decoration: const ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                       color: blueColor),
//                   child: _isLoad
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: primaryColor,
//                           ),
//                         )
//                       : const Text('UPDATE PROFILE'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
