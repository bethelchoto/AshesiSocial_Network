import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';

class ViewProfileScreen extends StatelessWidget {
  ViewProfileScreen(this.studentid, {super.key}) {
    _futurePost = HttpMethods().viewProfile(studentid);
  }

  String studentid;
  late Future<Map> _futurePost;

  late Map post;

  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
