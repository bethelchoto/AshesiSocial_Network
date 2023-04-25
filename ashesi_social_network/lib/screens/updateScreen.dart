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
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _yrGroupController = TextEditingController();
  final TextEditingController _bestFoodController = TextEditingController();
  final TextEditingController _bestMovieController = TextEditingController();
  final TextEditingController _campusHousing = TextEditingController();
  final TextEditingController _sidController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _majorController.text = widget.post['major'];
    _dobController.text = widget.post['DOB'];
    _yrGroupController.text = widget.post['year'];
    _bestFoodController.text = widget.post['bestFood'];
    _bestMovieController.text = widget.post['bestMovie'];
    _campusHousing.text = widget.post['campusHousing'];
  }

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
              ],
            ),
            Row(
              children: [
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
                Expanded(
                  child: ListTile(
                    subtitle: TextFieldInput(
                      hintText: "Housing",
                      textInputType: TextInputType.text,
                      textEditingController: _campusHousing,
                      textStyle: textBoxStyle,
                      numLines: 1,
                    ),
                  ),
                ),
              ],
            ),
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
            ElevatedButton(
              onPressed: () async {
                print(widget.post['SID'].toString());
                Map<String, String> dataToUpdate = {
                  // 'name': widget.post['SID'].toString(),
                  // "email": widget.post['SID'].toString(),
                  "SID": widget.post['SID'].toString(),
                  "major": _majorController.text,
                  "DOB": _dobController.text,
                  "year": _yrGroupController.text,
                  "bestFood": _bestFoodController.text,
                  "bestMovie": _bestMovieController.text,
                  "campusHousing": _campusHousing.text,
                };
                bool status = await HttpMethods()
                    .updateProfile(dataToUpdate, widget.post['SID'].toString());

                if (status) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Student Updated Successfully')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to Update')));
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
