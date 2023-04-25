import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';
import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
import 'package:webtech_flutter_app/screens/dashBoardScreen.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
import 'package:webtech_flutter_app/utils/utils.dart';
import 'package:webtech_flutter_app/widgets/text_field_input.dart';

class CreatePosts extends StatefulWidget {
  const CreatePosts({super.key});

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool _isLoad = false;
  bool isChecked = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _bodyController.dispose();
  }

  void postMssg() async {
    setState(() {
      _isLoad = true;
    });

    String mssgValue = await HttpMethods().postMssg(
      email: _emailController.text,
      body: _bodyController.text,
    );

    setState(() {
      _isLoad = false;
    });

    if (mssgValue != 'success') {
      showSnackBar(mssgValue, context);
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
        padding: const EdgeInsets.fromLTRB(0.0, 300.0, 450.0, 100.0),
        child: Column(
          children: [
            Expanded(
              // STUDENT EMAIL TEXTFIELD
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
            Expanded(
              // TYPE THE MESSAGE
              child: ListTile(
                subtitle: TextFieldInput(
                  hintText: "Type here",
                  textInputType: TextInputType.text,
                  textEditingController: _bodyController,
                  textStyle: textBoxStyle,
                  numLines: 10,
                ),
              ),
            ),

            // button SignUp
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 20.0, 20.0),
              child: InkWell(
                onTap: postMssg,
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
                      : const Text('Send'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
