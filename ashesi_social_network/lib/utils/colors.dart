import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

const backgroundColor = Color.fromARGB(255, 120, 39, 39);
const lowbackgroundColor = Colors.grey;
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const primaryColor = Colors.white;
const secondaryColor = Colors.grey;
const blackColor = Colors.black;
const textBoxStyle = TextStyle(color: blackColor);

const myTextStyle = TextStyle(
  color: blackColor,
  fontSize: 20,
);

const navRailTheme = IconThemeData(color: primaryColor, opacity: 1);
const navRailStyle = TextStyle(color: primaryColor);

const displayText = Text("\n" '     ASHESI\n' "     SOCIAL\n" "NETWORKING\n",
    style: TextStyle(fontSize: 70));

const sizeBox = SizedBox(
  height: 7,
);

final BottomItemNavy = BottomNavyBarItem(
    icon: const Icon(Icons.people),
    title: const Text('Users'),
    activeColor: primaryColor,
    textAlign: TextAlign.center);
final txtboarder = BoxDecoration(
    border: Border.all(
  color: Colors.black,
  width: 1.0,
));
const webScreenSize = 600;
const sizeBoxed = SizedBox(
  height: 7,
);
