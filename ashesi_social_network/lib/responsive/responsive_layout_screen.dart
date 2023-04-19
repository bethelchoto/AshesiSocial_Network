import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/providers/Uproviders.dart';
import 'package:webtech_flutter_app/utils/global.dart';
import 'package:webtech_flutter_app/models/users.dart' as modelUser;
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {super.key,
      required this.mobileScreenLayout,
      required this.webScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  // @override
  // void initState() {
  //   super.initState();
  //   addData();
  // }

  // addData() async {
  //   ProUser _userProvider = Provider.of(context, listen: false);
  //   await _userProvider.regetUser();
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth > webScreenSize) {
          //webscreen
          return widget.webScreenLayout;
        }
        //mobile screen
        return widget.mobileScreenLayout;
      },
    );
  }
}
