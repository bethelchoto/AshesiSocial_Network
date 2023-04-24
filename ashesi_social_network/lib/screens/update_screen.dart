// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:webtech_flutter_app/resources/HttpMethods.dart';

// import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
// import 'package:webtech_flutter_app/screens/create_post.dart';
// import 'package:webtech_flutter_app/screens/dashBoard.dart';
// import 'package:webtech_flutter_app/screens/dashBoardScreen.dart';
// import 'package:webtech_flutter_app/screens/profile_screen.dart';
// import 'package:webtech_flutter_app/pages/showMssgs.dart';
// import 'package:webtech_flutter_app/screens/sign_screen.dart';
// import 'package:webtech_flutter_app/screens/updateScreen.dart';
// import 'package:webtech_flutter_app/utils/colors.dart';
// import 'package:webtech_flutter_app/utils/global.dart';
// import 'package:webtech_flutter_app/utils/utils.dart';
// import 'package:webtech_flutter_app/widgets/text_field_input.dart';

// class UpdateProfileScreen extends StatefulWidget {
//   const UpdateProfileScreen({super.key});

//   @override
//   _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
// }

// class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
//   final TextEditingController _SIDController = TextEditingController();
//   final TextEditingController _majorController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _yrGroupController = TextEditingController();
//   final TextEditingController _bestFoodController = TextEditingController();
//   final TextEditingController _bestMovieController = TextEditingController();
//   final TextEditingController _campusHousing = TextEditingController();
//   Uint8List? _image;
//   bool _isLoad = false;
//   bool isChecked = false;

//   @override
//   void dispose() {
//     super.dispose();
//     _SIDController.dispose();
//     _majorController.dispose();
//     _dobController.dispose();
//     _yrGroupController.dispose();
//     _bestFoodController.dispose();
//     _bestMovieController.dispose();
//     _campusHousing.dispose();
//   }

//   void selectImg() async {
//     Uint8List img = await pickImage(ImageSource.gallery);
//     setState(() {
//       _image = img;
//     });
//   }

//   void updateProfile() async {
//     setState(() {
//       _isLoad = true;
//     });

//     String val = await HttpMethods().updateProfile(
//       SID: _SIDController.text,
//       major: _majorController.text,
//       dob: _dobController.text,
//       yrGroup: _yrGroupController.text,
//       bestFood: _bestFoodController.text,
//       bestMovie: _bestMovieController.text,
//       campusHousing: _campusHousing.text,
//     );

//     setState(() {
//       _isLoad = false;
//     });

//     if (val != 'success') {
//       showSnackBar(val, context);
//     } else {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => const ResponsiveLayout(
//             mobileScreenLayout: DashBoardScreen(),
//             webScreenLayout: DashBoardScreen(),
//           ),
//         ),
//       );
//     }
//   }

//   // void moveToLogin() {
//   //   Navigator.of(context).push(
//   //     MaterialPageRoute(
//   //       builder: (context) => const dashBoardScreen(),
//   //     ),
//   //   );
//   // }

//   @override
//   void initState() {
//     super.initState();
//     _dobController.text = "";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(450.0, 30.0, 450.0, 0),
//         child: Column(
//           children: [
//             sizeBoxed,

//             Stack(
//               children: [
//                 _image != null
//                     ? CircleAvatar(
//                         radius: 60,
//                         backgroundImage: MemoryImage(_image!),
//                       )
//                     : const CircleAvatar(
//                         radius: 60,
//                         backgroundImage: NetworkImage('assets/avatar.png'),
//                       ),
//                 Positioned(
//                   bottom: -3,
//                   left: 76,
//                   child: IconButton(
//                     onPressed: selectImg,
//                     icon: const Icon(
//                       Icons.add_a_photo,
//                     ),
//                   ),
//                 )
//               ],
//             ),

//             sizeBoxed,

//             Row(
//               children: [
//                 Expanded(
//                   // Student Major
//                   child: ListTile(
//                     subtitle: TextFieldInput(
//                       hintText: "Enter Student Major",
//                       textInputType: TextInputType.text,
//                       textEditingController: _majorController,
//                       textStyle: textBoxStyle,
//                       numLines: 1,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   // Student ID
//                   child: ListTile(
//                     subtitle: TextFieldInput(
//                       hintText: "Enter Student ID",
//                       textInputType: TextInputType.text,
//                       textEditingController: _SIDController,
//                       textStyle: textBoxStyle,
//                       numLines: 1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             sizeBoxed,
//             Row(
//               children: [
//                 Expanded(
//                   // Student DOB
//                   child: ListTile(
//                     subtitle: TextFieldInput(
//                       hintText: "Enter Student DOB",
//                       textInputType: TextInputType.text,
//                       textEditingController: _dobController,
//                       textStyle: textBoxStyle,
//                       numLines: 1,
//                     ),
//                   ),
//                 ),
//                 sizeBoxed,
//                 Expanded(
//                   // Student YearGroup
//                   child: ListTile(
//                     subtitle: TextFieldInput(
//                       hintText: "Enter Student Year Group",
//                       textInputType: TextInputType.text,
//                       textEditingController: _yrGroupController,
//                       textStyle: textBoxStyle,
//                       numLines: 1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             sizeBoxed,

//             Row(
//               children: [
//                 Expanded(
//                   // Student Best Food
//                   child: ListTile(
//                     subtitle: TextFieldInput(
//                       hintText: "Enter Student Best Food",
//                       textInputType: TextInputType.text,
//                       textEditingController: _bestFoodController,
//                       textStyle: textBoxStyle,
//                       numLines: 1,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   // Student Best Movie
//                   child: ListTile(
//                     subtitle: TextFieldInput(
//                       hintText: "Enter Student Movie",
//                       textInputType: TextInputType.text,
//                       textEditingController: _bestMovieController,
//                       textStyle: textBoxStyle,
//                       numLines: 1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             sizeBoxed,

//             ListTile(
//               subtitle: TextFieldInput(
//                 hintText: "Housing",
//                 textInputType: TextInputType.text,
//                 textEditingController: _campusHousing,
//                 textStyle: textBoxStyle,
//                 numLines: 1,
//               ),
//             ),

//             sizeBoxed,

//             // button SignUp
//             Padding(
//               padding: const EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 0),
//               child: InkWell(
//                 onTap: updateProfile,
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
//                       : const Text('Update'),
//                 ),
//               ),
//             ),
//             sizeBoxed,
//           ],
//         ),
//       ),
//     );
//   }
// }
