import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/utils/colors.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({super.key});

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  // setting expansion bar
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASHESI SOCIAL NETWORK'),
        backgroundColor: backgroundColor,
      ),
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
              extended: isExpanded,
              backgroundColor: backgroundColor,
              unselectedIconTheme:
                  IconThemeData(color: primaryColor, opacity: 1),
              unselectedLabelTextStyle: TextStyle(
                color: primaryColor,
              ),
              selectedIconTheme: IconThemeData(color: secondaryColor),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("Home"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.notifications),
                  label: Text("Notifications"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.message),
                  label: Text("Messages"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
              ],
              selectedIndex: 0),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(60.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //add navigation menu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // lets try to trigger navigation expansion
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(Icons.menu),
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
