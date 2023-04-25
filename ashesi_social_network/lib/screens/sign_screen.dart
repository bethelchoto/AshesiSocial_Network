import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';
import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
import 'package:webtech_flutter_app/screens/dashBoardScreen.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
import 'package:webtech_flutter_app/utils/utils.dart';
import 'package:webtech_flutter_app/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _yrGroupController = TextEditingController();
  final TextEditingController _bestFoodController = TextEditingController();
  final TextEditingController _bestMovieController = TextEditingController();
  final TextEditingController _campusHousing = TextEditingController();

  bool _isLoad = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _studentIdController.dispose();
    _usernameController.dispose();
    _majorController.dispose();
    _dobController.dispose();
    _yrGroupController.dispose();
    _bestFoodController.dispose();
    _bestMovieController.dispose();
    _campusHousing.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoad = true;
    });

    String userValue = await HttpMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      name: _usernameController.text,
      SID: _studentIdController.text,
      major: _majorController.text,
      DOB: _dobController.text,
      year: _yrGroupController.text,
      bestFood: _bestFoodController.text,
      bestMovie: _bestMovieController.text,
      campusHousing: _campusHousing.text,
    );

    setState(() {
      _isLoad = false;
    });

    if (userValue != 'success') {
      showSnackBar(userValue, context);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: DashBoardScreen(),
            webScreenLayout: DashBoardScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(450.0, 10.0, 450.0, 0),
        child: Column(
          children: [
            sizeBoxed,
            Stack(
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('assets/avatar.png'),
                ),
              ],
            ),

            sizeBoxed,

            Row(
              children: [
                Expanded(
                  // Student Name
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student Name",
                      textInputType: TextInputType.text,
                      textEditingController: _usernameController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  // Student Email
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student Email",
                      textInputType: TextInputType.text,
                      textEditingController: _emailController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
              ],
            ),

            sizeBoxed,

            Row(
              children: [
                Expanded(
                  // Student Major
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student Major",
                      textInputType: TextInputType.text,
                      textEditingController: _majorController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  // Student ID
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student ID",
                      textInputType: TextInputType.text,
                      textEditingController: _studentIdController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
              ],
            ),

            sizeBoxed,
            Row(
              children: [
                Expanded(
                  // Student DOB
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student DOB",
                      textInputType: TextInputType.text,
                      textEditingController: _dobController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
                sizeBoxed,
                Expanded(
                  // Student YearGroup
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student Year Group",
                      textInputType: TextInputType.text,
                      textEditingController: _yrGroupController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
              ],
            ),

            sizeBoxed,

            Row(
              children: [
                Expanded(
                  // Student Best Food
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student Best Food",
                      textInputType: TextInputType.text,
                      textEditingController: _bestFoodController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
                Expanded(
                  // Student Best Movie
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student Movie",
                      textInputType: TextInputType.text,
                      textEditingController: _bestMovieController,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
              ],
            ),

            sizeBoxed,

            ListTile(
              subtitle: TextFieldInput(
                hintText: "Housing",
                textInputType: TextInputType.text,
                textEditingController: _campusHousing,
                textStyle: textBoxStyle,
                numLines: 1,
              ),
            ),

            sizeBoxed,

            //password
            ListTile(
              subtitle: TextFieldInput(
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                ispass: true,
                textStyle: textBoxStyle,
                numLines: 1,
              ),
            ),
            sizeBoxed,

            // button SignUp
            Padding(
              padding: const EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 0),
              child: InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: blueColor),
                  child: _isLoad
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Sign Up'),
                ),
              ),
            ),

            sizeBoxed,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: const Text("Already Have Account?"),
                ),
                GestureDetector(
                  // moveToLogin
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                    ),
                    child: const Text(
                      "SignUp",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
