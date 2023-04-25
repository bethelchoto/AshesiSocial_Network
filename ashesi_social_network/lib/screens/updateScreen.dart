import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
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

  bool _isLoad = false;

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
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(450.0, 10, 450.0, 0),
        child: Column(
          children: [
            Stack(
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('assets/avatar.png'),
                ),
              ],
            ),
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
            // button login
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: InkWell(
                onTap: () async {
                  Map<String, String> dataToUpdate = {
                    "SID": widget.post['SID'].toString(),
                    "major": _majorController.text,
                    "DOB": _dobController.text,
                    "year": _yrGroupController.text,
                    "bestFood": _bestFoodController.text,
                    "bestMovie": _bestMovieController.text,
                    "campusHousing": _campusHousing.text,
                  };
                  bool status = await HttpMethods().updateProfile(
                      dataToUpdate, widget.post['SID'].toString());

                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Student Updated Successfully')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to Update')));
                  }
                },
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
                      : const Text('UPDATE'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
