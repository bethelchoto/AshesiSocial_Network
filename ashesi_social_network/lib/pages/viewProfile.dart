import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';
import 'package:webtech_flutter_app/screens/updateScreen.dart';
import 'package:webtech_flutter_app/utils/colors.dart';

class viewProfile extends StatelessWidget {
  viewProfile(this.profileId, {super.key}) {
    _futureMssgs = HttpMethods().viewProfile(profileId);
  }
  String profileId;
  late Future<Map> _futureMssgs;
  late Map post;

  final TextEditingController _profileIdController = TextEditingController();
  bool _isLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(450.0, 10.0, 450.0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: const [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage('assets/avatar.png'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<Map>(
                future: _futureMssgs,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('Some error occurred ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    post = snapshot.data!;

                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('NAME'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['name']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('EMAIL'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['email']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('SID'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['SID']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('MAJOR'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['major']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('D.O.B'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['DOB']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('YEAR GROUP'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['year']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('BEST MOVIE'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['bestMovie']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('BEST FOOD'),
                                subtitle: Container(
                                  decoration: txtboarder,
                                  child: Text(
                                    '${post['bestFood']}',
                                    style: myTextStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Expanded(
                          child: ListTile(
                            title: const Text('LIVES ON HOUSING'),
                            subtitle: Container(
                              decoration: txtboarder,
                              child: Text(
                                '${post['campusHousing']}',
                                style: myTextStyle,
                              ),
                            ),
                          ),
                        ),

                        // button login
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: InkWell(
                            onTap: () {
                              print(post);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UpdateProfile(post)));
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
                                  : const Text('UPDATE PROFILE'),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
