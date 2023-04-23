import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/responsive/mobile_screen_layout.dart';
import 'package:webtech_flutter_app/responsive/responsive_layout_screen.dart';
import 'package:webtech_flutter_app/responsive/web_screen_layout.dart';
import 'package:webtech_flutter_app/screens/dashBoard.dart';
import 'package:webtech_flutter_app/screens/profile_screen.dart';
import 'package:webtech_flutter_app/screens/sign_screen.dart';
import 'package:webtech_flutter_app/utils/colors.dart';
import 'package:webtech_flutter_app/screens/update_screen.dart';
import 'package:webtech_flutter_app/screens/messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDPRiaJ6IS7Z3fd70HeY1rNQeIebvcnb28",
        appId: "1:157903667297:web:3eaedf445f5dcaf8e0ea20",
        messagingSenderId: "157903667297",
        projectId: "ashesisocial",
        storageBucket: "ashesisocial.appspot.com"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   // providers: [
    //   //   ChangeNotifierProvider(
    //   //     create: (_) => ProUser(),
    //   //   ),
    //   // ],
    //   child:
    return MaterialApp(
      title: 'Ashesi Social Network',
      theme: ThemeData(scaffoldBackgroundColor: primaryColor),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const ResponsiveLayout(
                mobileScreenLayout: mobileScreenLayout(),
                webScreenLayout: webScreenLayout(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const MessagingList();
        },
      ),
    );
  }
}
