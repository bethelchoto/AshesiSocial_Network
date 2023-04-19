import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool ispass;
  final String hintText;
  final TextInputType textInputType;
  final TextStyle textStyle;

  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.ispass = false,
    required this.hintText,
    required this.textInputType,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        fillColor: primaryColor,
        filled: true,

        // contentPadding: const EdgeInsets.all(20),
        // contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      ),
      keyboardType: textInputType,
      obscureText: ispass,
      style: textStyle,
    );
  }
}
