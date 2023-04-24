import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
import 'package:webtech_flutter_app/utils/global.dart';
import 'package:webtech_flutter_app/widgets/text_field_input.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile(this.post, {super.key});
  Map post;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _yrGroupController = TextEditingController();
  final TextEditingController _bestFoodController = TextEditingController();
  final TextEditingController _bestMovieController = TextEditingController();
  final TextEditingController _campusHousing = TextEditingController();

  @override
  void initState() {
    super.initState();
    _majorController.text = widget.post['major'];
    _dobController.text = widget.post['dob'];
    _yrGroupController.text = widget.post['yrGroup'];
    _bestFoodController.text = widget.post['bestFood'];
    _bestMovieController.text = widget.post['bestMovie'];
    _campusHousing.text = widget.post['campusHousing'];
  }

//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(450.0, 30.0, 450.0, 0),
//         child: Column(
//           children: [
//             sizeBoxed,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(450.0, 30.0, 450.0, 0),
        child: Column(
          children: [
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
                      hintText: "Enter Best Movie",
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
            ElevatedButton(
                onPressed: () async {
                  Map<String, String> dataToUpdate = {
                    'bestFood': _bestFoodController.text,
                    'bestMovie': _bestMovieController.text,
                    'major': _majorController.text,
                    'dob': _dobController.text,
                    'campusHousing': _campusHousing.text,
                    'yrGroup': _yrGroupController.text,
                  };
                  bool status = await HttpMethods().updateProfile(
                      dataToUpdate, _studentIdController.text.toString());

                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Student Updated Successfully')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to Update')));
                  }
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
