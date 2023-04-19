// import 'dart:html';
// import 'package:intl/intl.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:webtech_flutter_app/resources/auth_methods.dart';
// import 'package:webtech_flutter_app/responsive/mobile_screen_layout.dart';
// import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
// import 'package:webtech_flutter_app/responsive/web_screen_layout.dart';
// import 'package:webtech_flutter_app/screens/login_screen.dart';
// import 'package:webtech_flutter_app/utils/colors.dart';
// import 'package:webtech_flutter_app/utils/global.dart';
// import 'package:webtech_flutter_app/utils/utils.dart';
// import 'package:webtech_flutter_app/widgets/text_field_input.dart';

// class signupScreen extends StatefulWidget {
//   const signupScreen({super.key});

//   @override
//   State<signupScreen> createState() => _signupScreenState();
// }

// class _signupScreenState extends State<signupScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _studentIDController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
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
//     _emailController.dispose();
//     _passwordController.dispose();
//     _studentIDController.dispose();
//     _usernameController.dispose();
//     _majorController.dispose();
//     _dobController.dispose();
//     _yrGroupController.dispose();
//     _bestFoodController.dispose();
//     _bestMovieController.dispose();
//     _campusHousing.dispose();
//   }

//   void signUpUser() async {
//     setState(() {
//       _isLoad = true;
//     });

//     setState(() {
//       _isLoad = false;
//     });

//     String val = await AuthMethods().signUpUser(
//       email: _emailController.text,
//       password: _passwordController.text,
//       username: _usernameController.text,
//       studentID: _studentIDController.text,
//       major: _majorController.text,
//       dob: _dobController.text,
//       yrGroup: _yrGroupController.text,
//       bestFood: _bestFoodController.text,
//       bestMovie: _bestMovieController.text,
//       campusHousing: _campusHousing.text,
//       file: _image!,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('ASHESI SOCIAL NETWORK'),
//       // ),

//       body: Padding(
//         padding: EdgeInsets.fromLTRB(300.0, 20.0, 300.0, 0),
//         child: Column(
//           children: [
//             // ListTile(
//             //   subtitle: TextFormField(
//             //     decoration: const InputDecoration(
//             //       border: OutlineInputBorder(
//             //           borderRadius: BorderRadius.all(Radius.circular(8))),
//             //       hintText: 'Enter Student Name ',
//             //     ),
//             //   ),
//             // ),

//             sizeBoxed,

//             const ListTile(
//               subtitle: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                   ),
//                   hintText: 'Enter Student Name ',
//                 ),
//               ),
//             ),

//             sizeBoxed,
//             //password
//             // ListTile(
//             //   subtitle: TextFieldInput(

//             //     hintText: "Enter your password",
//             //     textInputType: TextInputType.text,
//             //     textEditingController: _passwordController,
//             //     ispass: true,
//             //   ),
//             // ),

//             sizeBoxed,

//             ListTile(
//               subtitle: TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8))),
//                   hintText: 'Enter Student Email ',
//                 ),
//               ),
//             ),

//             sizeBoxed,
//             ListTile(
//               subtitle: TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8))),
//                   hintText: 'Enter Student Major ',
//                 ),
//               ),
//             ),

//             sizeBoxed,

//             ListTile(
//               subtitle: TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8))),
//                   hintText: 'Enter Student ID  ',
//                 ),
//               ),
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: ListTile(
//                     // contentPadding: EdgeInsets.symmetric(vertical: 20.0),
//                     subtitle: TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         hintText: 'Enter Student DOB',
//                       ),
//                     ),
//                   ),
//                 ),
//                 sizeBoxed,
//                 Expanded(
//                   child: ListTile(
//                     subtitle: TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         hintText: 'Enter Student Year Group',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             sizeBoxed,

//             Row(
//               children: [
//                 Expanded(
//                   child: ListTile(
//                     // contentPadding: EdgeInsets.symmetric(vertical: 20.0),
//                     subtitle: TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         hintText: 'Enter Student Best Food',
//                       ),
//                     ),
//                   ),
//                 ),
//                 sizeBoxed,
//                 Expanded(
//                   child: ListTile(
//                     subtitle: TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         hintText: 'Enter Student Best Movie',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             sizeBoxed,

//             // compus housing
//             Row(
//               children: [
//                 Expanded(
//                   child: ListTile(
//                     title: Text('Do you have onCampus Housing?'),
//                     leading: Checkbox(
//                       value: isChecked,
//                       onChanged: (value) {
//                         setState(() {
//                           isChecked = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 sizeBoxed,
//                 Expanded(
//                   child: ListTile(
//                     subtitle: TextFormField(
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         hintText: '  Year Of Study',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // button login
//             ListTile(
//               subtitle: ElevatedButton(
//                 onPressed: () {
//                   // Add your button's onPressed logic here
//                 },
//                 child: Text('Enter your email'),
//                 style: ButtonStyle(
//                   fixedSize: MaterialStateProperty.all(Size(200, 50)),
//                 ),
//               ),
//             ),
//             sizeBoxed,

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 8,
//                   ),
//                   child: const Text("Already Have Account?"),
//                 ),
//                 GestureDetector(
//                   // moveToLogin
//                   onTap: () {},
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 8,
//                     ),
//                     child: const Text(
//                       "LogIn",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
