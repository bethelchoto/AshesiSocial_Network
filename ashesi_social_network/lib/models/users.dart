import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String SID;
  final String major;
  final String dob;
  final String yrGroup;
  final String bestFood;
  final String bestMovie;
  final String campusHousing;
  // final String photoURL;

  const User({
    required this.username,
    required this.email,
    required this.SID,
    required this.major,
    required this.dob,
    required this.yrGroup,
    required this.bestFood,
    required this.bestMovie,
    required this.campusHousing,
    // required this.photoURL,
  });

  Map<String, dynamic> formateJson() => {
        'username': username,
        'email': email,
        'SID': SID,
        'major': major,
        'dob': dob,
        'yrGroup': yrGroup,
        'bestFood': bestFood,
        'bestMovie': bestMovie,
        'campusHousing': campusHousing,
        // 'photoURL': photoURL,
      };

  static User fromSnap(DocumentSnapshot docsnap) {
    var snaps = docsnap.data() as Map<String, dynamic>;
    return User(
      username: snaps['username'],
      email: snaps['email'],
      SID: snaps['SID'],
      major: snaps['major'],
      dob: snaps['dob'],
      yrGroup: snaps['yrGroup'],
      bestFood: snaps['bestFood'],
      bestMovie: snaps['bestMovie'],
      campusHousing: snaps['campusHousing'],
      // photoURL: snaps['photoURL'],
    );
  }
}
