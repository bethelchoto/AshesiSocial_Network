// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserInfo {
//   final String username;
//   final String email;
//   // final String studentID;
//   final String SID;
//   // final String uid;
//   // final String major;
//   // final String dob;
//   // final String yrGroup;
//   // final String bestFood;
//   // final String bestMovie;
//   // final String campusHousing;
//   // final String photoURL;

//   const UserInfo({
//     required this.username,
//     required this.email,
//     // required this.studentID,
//     required this.SID,
//     // required this.major,
//     // required this.dob,
//     // required this.yrGroup,
//     // required this.bestFood,
//     // required this.bestMovie,
//     // required this.campusHousing,
//     // required this.photoURL,
//   });

//   Map<String, dynamic> formateJson() => {
//         'username': username,
//         'email': email,
//         // 'studentID': studentID,
//         'SID': SID,
//         // 'uid': uid,
//         // 'major': major,
//         // 'dob': dob,
//         // 'yrGroup': yrGroup,
//         // 'bestFood': bestFood,
//         // 'bestMovie': bestMovie,
//         // 'campusHousing': campusHousing,
//         // 'photoURL': photoURL,
//       };

//   static UserInfo fromSnap(DocumentSnapshot docsnap) {
//     var snaps = docsnap.data() as Map<String, dynamic>;
//     return UserInfo(
//       username: snaps['username'],
//       email: snaps['email'],
//       // studentID: snaps['studentID'],
//       SID: snaps['SID'],
//       // uid: snaps['uid'],
//       // major: snaps['major'],
//       // dob: snaps['dob'],
//       // yrGroup: snaps['yrGroup'],
//       // bestFood: snaps['bestFood'],
//       // bestMovie: snaps['bestMovie'],
//       // campusHousing: snaps['campusHousing'],
//       // photoURL: snaps['photoURL'],
//     );
//   }
// }
