import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/screens/create_post.dart';
import 'package:webtech_flutter_app/utils/colors.dart';

class ShowFeedPage extends StatefulWidget {
  const ShowFeedPage({super.key});

  @override
  State<ShowFeedPage> createState() => _ShowFeedPageState();
}

class _ShowFeedPageState extends State<ShowFeedPage> {
  final Stream<QuerySnapshot> _feedStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePosts()));
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(100.0, 50.0, 100.0, 0),
        child: Container(
          child: Row(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<Row> clientsWidgets = [];

                    if (snapshot.hasData) {
                      final clients = snapshot.data?.docs.reversed.toList();
                      for (var client in clients!) {
                        final clientsWidget = Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10.0),
                                color: secondaryColor,
                                width: 600.0,
                                height: 200.0,
                                child: ListTile(
                                  title: Text('${client['email']}',
                                      overflow: TextOverflow.ellipsis),
                                  subtitle: Text('${client['body']}'),
                                  leading: const CircleAvatar(
                                      backgroundImage:
                                          NetworkImage('assets/avatar.png')),
                                  trailing: Text('${client['currenttime']}'),
                                ))
                          ],
                        );
                        clientsWidgets.add(clientsWidget);
                      }
                    }
                    return Expanded(
                      child: ListView(
                        children: clientsWidgets,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
