import 'package:flutter/material.dart';
import 'package:webtech_flutter_app/resources/HttpMethods.dart';
import 'package:webtech_flutter_app/screens/create_post.dart';

class ShowMssgs extends StatelessWidget {
  ShowMssgs({super.key});

  Future<List<Map>> _futureMssgs = HttpMethods().fetchMssgs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePosts()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map>>(
        future: _futureMssgs,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // check for errors
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error has occured ${snapshot.error}"),
            );
          }
          // data has arrived
          if (snapshot.hasData) {
            List<Map> postMssgs = snapshot.data;

            return ListView.builder(
              itemCount: postMssgs.length,
              itemBuilder: (context, index) {
                Map thismssg = postMssgs[index];
                return ListTile(
                  contentPadding:
                      const EdgeInsets.fromLTRB(450.0, 30.0, 450.0, 0),
                  title: Text(
                    '${thismssg['email']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('${thismssg['body']}'),
                  leading: const CircleAvatar(
                      backgroundImage: NetworkImage('assets/avatar.png')),
                  trailing: const Text('10:23 PM'),
                );
              },
            );
          }
          // display loader
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
