// import 'package:flutter/material.dart';
// import 'package:webtech_flutter_app/utils/colors.dart';

// class dashBoardScreen extends StatefulWidget {
//   const dashBoardScreen({super.key});

//   @override
//   State<dashBoardScreen> createState() => _dashBoardScreenState();
// }

// class _dashBoardScreenState extends State<dashBoardScreen> {
//   // setting expansion bar
//   bool isExpanded = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           //Let's start by adding the Navigation Rail
//           NavigationRail(
//             extended: isExpanded,
//             backgroundColor: backgroundColor,
//             unselectedIconTheme: navRailTheme,
//             unselectedLabelTextStyle: navRailStyle,
//             selectedIconTheme: const IconThemeData(color: secondaryColor),
//             destinations: const [
//               NavigationRailDestination(
//                 icon: Icon(Icons.home),
//                 label: Text("Home"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.notifications),
//                 label: Text("Notifications"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.person),
//                 label: Text("Profile"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.message),
//                 label: Text("Messages"),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.settings),
//                 label: Text("Settings"),
//               ),
//             ],
//             selectedIndex: 0,
//           ),
//           Expanded(
//             child: Padding(
//               // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//               padding: const EdgeInsets.all(1.0),

//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     //add navigation menu
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             // lets try to trigger navigation expansion
//                             setState(() {
//                               isExpanded = !isExpanded;
//                             });
//                           },
//                           icon: const Icon(Icons.menu),
//                         ),
//                         const CircleAvatar(
//                           radius: 30,
//                           backgroundImage: NetworkImage('assets/avatar.png'),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(50.0),
//                       width: MediaQuery.of(context).size.width * 2.0,
//                       child: const Center(
//                         child: displayText,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
