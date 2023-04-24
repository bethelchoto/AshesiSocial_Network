import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/screens/sign_screen.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
import 'package:webtech_flutter_app/widgets/text_field_input.dart';

class ShowProfile extends StatefulWidget {
  ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  final TextEditingController _stdIdController = TextEditingController();
  bool _isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Profile'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Icon(Icons.person_add_alt_outlined),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(450.0, 250.0, 450.0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    // Student Name
                    child: ListTile(
                      subtitle: TextFieldInput(
                        hintText: "Enter ID",
                        textInputType: TextInputType.text,
                        textEditingController: _stdIdController,
                        textStyle: textBoxStyle,
                        numLines: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        final id = _stdIdController.text;
                      }, //to be tapped
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
                            : const Text('View'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
