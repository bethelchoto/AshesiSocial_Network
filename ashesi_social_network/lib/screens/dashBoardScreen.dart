import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/pages/home_screen.dart';
import 'package:webtech_flutter_app/pages/showFeedPages.dart';
import 'package:webtech_flutter_app/pages/showMssgs.dart';
import 'package:webtech_flutter_app/pages/showProfile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashSection(),
      bottomNavigationBar: dashBoardScreen(),
    );
  }

  dashSection() {
    switch (index) {
      case 0:
        return const ShowFeedPage();
      case 1:
        return const ShowFeedPage();
      case 2:
        return const ShowFeedPage();
      case 3:
        return showProfile();
      case 4:
        return ShowMssgs();
    }
  }

  dashBoardScreen() {
    return BottomNavyBar(
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text('Message'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}
