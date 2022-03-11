import 'package:api_pract/services/home_services.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API"),
        ),
        body: FutureBuilder(
          future: getPostApi(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${snapshot.data[index].id}"),
                      title: Text("${snapshot.data[index].title}"),
                      subtitle: Text("${snapshot.data[index].body}"),
                    );
                  });
            }
          },
        ));
  }
}
