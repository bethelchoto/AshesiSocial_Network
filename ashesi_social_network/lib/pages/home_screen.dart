import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        width: MediaQuery.of(context).size.width * 2.0,
        child: const Center(
          child: displayText,
        ),
      ),
    );
  }
}
