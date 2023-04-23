import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webtech_flutter_app/resources/auth_methods.dart';
import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
import 'package:webtech_flutter_app/screens/dashBoard.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
import 'package:webtech_flutter_app/utils/global.dart';
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
  final TextEditingController _SIDController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _yrGroupController = TextEditingController();
  final TextEditingController _bestFoodController = TextEditingController();
  final TextEditingController _bestMovieController = TextEditingController();
  final TextEditingController _campusHousing = TextEditingController();
  Uint8List? _image;
  bool _isLoad = false;
  bool isChecked = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _SIDController.dispose();
    _usernameController.dispose();
    _majorController.dispose();
    _dobController.dispose();
    _yrGroupController.dispose();
    _bestFoodController.dispose();
    _bestMovieController.dispose();
    _campusHousing.dispose();
  }

  void selectImg() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoad = true;
    });

    String val = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      SID: _SIDController.text,
      major: _majorController.text,
      dob: _dobController.text,
      yrGroup: _yrGroupController.text,
      bestFood: _bestFoodController.text,
      bestMovie: _bestMovieController.text,
      campusHousing: _campusHousing.text,
      // file: _image!,
    );

    setState(() {
      _isLoad = false;
    });

    if (val != 'success') {
      showSnackBar(val, context);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: dashBoardScreen(),
            webScreenLayout: dashBoardScreen(),
          ),
        ),
      );
    }
  }

  void moveToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const dashBoardScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dobController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    // Color getColor(Set<MaterialState> states) {
    //   const Set<MaterialState> interactiveStates = <MaterialState>{
    //     MaterialState.pressed,
    //     MaterialState.hovered,
    //     MaterialState.focused,
    //   };
    //   if (states.any(interactiveStates.contains)) {
    //     return Colors.blue;
    //   }
    //   return Colors.red;
    // }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(450.0, 30.0, 450.0, 0),
        child: Column(
          children: [
            sizeBoxed,
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('assets/avatar.png'),
                      ),
                Positioned(
                  bottom: -3,
                  left: 76,
                  child: IconButton(
                    onPressed: selectImg,
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                )
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
                    ),
                  ),
                ),
                Expanded(
                  // Student ID
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Enter Student ID",
                      textInputType: TextInputType.text,
                      textEditingController: _SIDController,
                      textStyle: textBoxStyle,
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
