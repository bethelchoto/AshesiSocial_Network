// import 'package:flutter/material.dart';
// import 'package:webtech_flutter_app/resources/auth_methods.dart';
// import 'package:webtech_flutter_app/responsive/mobile_screen_layout.dart';
// import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
// import 'package:webtech_flutter_app/responsive/web_screen_layout.dart';
// import 'package:webtech_flutter_app/screens/sign_screen.dart';
// import 'package:webtech_flutter_app/utils/colors.dart';
// import 'package:webtech_flutter_app/utils/utils.dart';
// import 'package:webtech_flutter_app/widgets/text_field_input.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoad = false;

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }

//   void userLogin() async {
//     setState(() {
//       _isLoad = true;
//     });

//     String val = await AuthMethods().userLogin(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );
//     if (val == 'success') {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => const ResponsiveLayout(
//             mobileScreenLayout: mobileScreenLayout(),
//             webScreenLayout: webScreenLayout(),
//           ),
//         ),
//       );
//     } else {
//       showSnackBar(val, context);
//     }
//     setState(() {
//       _isLoad = false;
//     });
//   }

//   void moveToSignUp() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const SignUpScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 32),
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Container(),
//                 flex: 2,
//               ),
//               // Image.asset(
//               //   'ashesi.jpg',
//               //   height: 64,
//               // ),
//               const SizedBox(
//                 height: 64,
//               ),
//               // Container(
//               //   color: primaryColor,
//               //   //text field input for email
//               //   child: TextFieldInput(

//               //     hintText: "Enter your email",
//               //     textInputType: TextInputType.emailAddress,
//               //     textEditingController: _emailController,
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),
//               // Container(
//               //   color: primaryColor,
//               //   //text field input for password
//               //   child: TextFieldInput(
//               //     hintText: "Enter your password",
//               //     textInputType: TextInputType.text,
//               //     textEditingController: _passwordController,
//               //     ispass: true,
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 20,
//               ),
//               // button login
//               InkWell(
//                 onTap: userLogin,
//                 child: Container(
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   decoration: const ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(4),
//                         ),
//                       ),
//                       color: blueColor),
//                   child: _isLoad
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: primaryColor,
//                           ),
//                         )
//                       : const Text('Log in'),
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Flexible(
//                 flex: 2,
//                 child: Container(),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 8,
//                     ),
//                     child: const Text("Don't have an account?"),
//                   ),
//                   GestureDetector(
//                     onTap: moveToSignUp,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8,
//                       ),
//                       child: const Text(
//                         "SignUp",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
