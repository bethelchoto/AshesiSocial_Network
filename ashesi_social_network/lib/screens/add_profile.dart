// import 'package:flutter/material.dart';
// import 'package:webtech_flutter_app/resources/HttpHelperAPI.dart';

// class AddProfile extends StatefulWidget {
//   const AddProfile({super.key});

//   @override
//   State<AddProfile> createState() => _AddProfileState();
// }

// class _AddProfileState extends State<AddProfile> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _SIDController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _majorController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _yrGroupController = TextEditingController();
//   final TextEditingController _bestFoodController = TextEditingController();
//   final TextEditingController _bestMovieController = TextEditingController();
//   final TextEditingController _campusHousing = TextEditingController();
//   bool _isLoad = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(450.0, 30.0, 450.0, 0),
//         child: Column(
//           children: [
//             TextFormField(
//               decoration: InputDecoration(hintText: 'UserName'),
//               controller: _usernameController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'Email'),
//               controller: _emailController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'SID'),
//               controller: _SIDController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'Major'),
//               controller: _majorController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'DOB'),
//               controller: _dobController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'Year Group'),
//               controller: _yrGroupController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'Best movie'),
//               controller: _bestMovieController,
//             ),

//             TextFormField(
//               decoration: InputDecoration(hintText: 'Best food'),
//               controller: _bestFoodController,
//             ),
//             TextFormField(
//               decoration: InputDecoration(hintText: 'Campus Housing'),
//               controller: _campusHousing,
//             ),

//             ElevatedButton(
//                 onPressed: () async {
//                   Map<String, String> profile = {
//                     'email': _emailController.text,
//                     'password': _passwordController.text,
//                     'username': _usernameController.text,
//                     'SID': _SIDController.text,
//                     'major': _majorController.text,
//                     'dob': _dobController.text,
//                     'yrGroup': _yrGroupController.text,
//                     'bestFood': _bestFoodController.text,
//                     'bestMovie': _bestMovieController.text,
//                     'campusHousing': _campusHousing.text,
//                   };
//                   bool status = await HttpAPIHelper().createProfile(profile);
//                   if (status) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Profile Successfully')));
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Profile Failed')));
//                   }
//                 },
//                 child: Text('Submit'))

//             // Row(
//             //   children: [
//             //     Expanded(
//             //       // Student Name
//             //       child: ListTile(
//             //         subtitle: TextFieldInput(
//             //           hintText: "Enter Student Name",
//             //           textInputType: TextInputType.text,
//             //           textEditingController: _usernameController,
//             //           textStyle: textBoxStyle,
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       // Student Email
//             //       child: ListTile(
//             //         subtitle: TextFieldInput(
//             //           hintText: "Enter Student Email",
//             //           textInputType: TextInputType.text,
//             //           textEditingController: _emailController,
//             //           textStyle: textBoxStyle,
//             //         ),
//             //       ),
//             //     ),
//             //     sizeBox,
//             //     Row(
//             //       children: [
//             //         Expanded(
//             //           // Student Major
//             //           child: ListTile(
//             //             subtitle: TextFieldInput(
//             //               hintText: "Enter Student Major",
//             //               textInputType: TextInputType.text,
//             //               textEditingController: _majorController,
//             //               textStyle: textBoxStyle,
//             //             ),
//             //           ),
//             //         ),
//             //         Expanded(
//             //           // Student ID
//             //           child: ListTile(
//             //             subtitle: TextFieldInput(
//             //               hintText: "Enter Student ID",
//             //               textInputType: TextInputType.text,
//             //               textEditingController: _SIDController,
//             //               textStyle: textBoxStyle,
//             //             ),
//             //           ),
//             //         ),
//             //       ],
//             //     ),

//             //     sizeBox,
//             //     Row(
//             //       children: [
//             //         Expanded(
//             //           // Student DOB
//             //           child: ListTile(
//             //             subtitle: TextFieldInput(
//             //               hintText: "Enter Student DOB",
//             //               textInputType: TextInputType.text,
//             //               textEditingController: _dobController,
//             //               textStyle: textBoxStyle,
//             //             ),
//             //           ),
//             //         ),
//             //         sizeBox,
//             //         Expanded(
//             //           // Student YearGroup
//             //           child: ListTile(
//             //             subtitle: TextFieldInput(
//             //               hintText: "Enter Student Year Group",
//             //               textInputType: TextInputType.text,
//             //               textEditingController: _yrGroupController,
//             //               textStyle: textBoxStyle,
//             //             ),
//             //           ),
//             //         ),
//             //       ],
//             //     ),

//             //     sizeBox,

//             //     Row(
//             //       children: [
//             //         Expanded(
//             //           // Student Best Food
//             //           child: ListTile(
//             //             subtitle: TextFieldInput(
//             //               hintText: "Enter Student Best Food",
//             //               textInputType: TextInputType.text,
//             //               textEditingController: _bestFoodController,
//             //               textStyle: textBoxStyle,
//             //             ),
//             //           ),
//             //         ),
//             //         Expanded(
//             //           // Student Best Movie
//             //           child: ListTile(
//             //             subtitle: TextFieldInput(
//             //               hintText: "Enter Student Movie",
//             //               textInputType: TextInputType.text,
//             //               textEditingController: _bestMovieController,
//             //               textStyle: textBoxStyle,
//             //             ),
//             //           ),
//             //         ),
//             //       ],
//             //     ),

//             //     sizeBox,

//             //     ListTile(
//             //       subtitle: TextFieldInput(
//             //         hintText: "Housing",
//             //         textInputType: TextInputType.text,
//             //         textEditingController: _campusHousing,
//             //         textStyle: textBoxStyle,
//             //       ),
//             //     ),

//             //     sizeBox,

//             //     //password
//             //     ListTile(
//             //       subtitle: TextFieldInput(
//             //         hintText: "Enter your password",
//             //         textInputType: TextInputType.text,
//             //         textEditingController: _passwordController,
//             //         ispass: true,
//             //         textStyle: textBoxStyle,
//             //       ),
//             //     ),
//             //     sizeBox,

//             //     ElevatedButton(
//             //         onPressed: () async {
//             //           Map<String, String> profile = {
//             //             'email': _emailController.text,
//             //             'password': _passwordController.text,
//             //             'username': _usernameController.text,
//             //             'SID': _SIDController.text,
//             //             'major': _majorController.text,
//             //             'dob': _dobController.text,
//             //             'yrGroup': _yrGroupController.text,
//             //             'bestFood': _bestFoodController.text,
//             //             'bestMovie': _bestMovieController.text,
//             //             'campusHousing': _campusHousing.text,
//             //           };
//             //           bool status =
//             //               await HttpAPIHelper().createProfile(profile);
//             //           if (status) {
//             //             ScaffoldMessenger.of(context).showSnackBar(
//             //                 SnackBar(content: Text('Profile Successfully')));
//             //           } else {
//             //             ScaffoldMessenger.of(context).showSnackBar(
//             //                 SnackBar(content: Text('Profile Failed')));
//             //           }
//             //         },
//             //         child: Text('Submit'))

//             //     // Padding(
//             //     //   padding: const EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 0),
//             //     //   child: InkWell(
//             //     //     onTap: () async {
//             //     //       Map<String, String> profile = {
//             //     //         'email': _emailController.text,
//             //     //         'password': _passwordController.text,
//             //     //         'username': _usernameController.text,
//             //     //         'SID': _SIDController.text,
//             //     //         'major': _majorController.text,
//             //     //         'dob': _dobController.text,
//             //     //         'yrGroup': _yrGroupController.text,
//             //     //         'bestFood': _bestFoodController.text,
//             //     //         'bestMovie': _bestMovieController.text,
//             //     //         'campusHousing': _campusHousing.text,
//             //     //       };
//             //     //       bool status =
//             //     //           await HttpAPIHelper().createProfile(profile);
//             //     //       if (status) {
//             //     //         ScaffoldMessenger.of(context).showSnackBar(
//             //     //             SnackBar(content: Text('Profile Successfully')));
//             //     //       } else {
//             //     //         ScaffoldMessenger.of(context).showSnackBar(
//             //     //             SnackBar(content: Text('Profile Failed')));
//             //     //       }
//             //     //     },
//             //     //     child: Container(
//             //     //       width: double.infinity,
//             //     //       alignment: Alignment.center,
//             //     //       padding: const EdgeInsets.symmetric(vertical: 20),
//             //     //       decoration: const ShapeDecoration(
//             //     //         shape: RoundedRectangleBorder(
//             //     //           borderRadius: BorderRadius.all(
//             //     //             Radius.circular(10),
//             //     //           ),
//             //     //         ),
//             //     //         color: blueColor,
//             //     //       ),
//             //     //       child: _isLoad
//             //     //           ? const Center(
//             //     //               child: CircularProgressIndicator(
//             //     //                 color: primaryColor,
//             //     //               ),
//             //     //             )
//             //     //           : const Text('Sign Up'),
//             //     //     ),
//             //     //   ),
//             //     // ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
