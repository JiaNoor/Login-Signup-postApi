import 'dart:convert';

import 'package:api_pract/models/posts_model.dart';
import 'package:http/http.dart' as http;

getPostApi() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var jsonData = jsonDecode(response.body);

  List<PostsModel> postLits = [];

  if (response.statusCode == 200) {
    for (var i in jsonData) {
      PostsModel posts = PostsModel(
          userId: i['userId'], id: i['id'], title: i['title'], body: i['body']);
      postLits.add(posts);
    }
    return postLits;
  } else {
    return postLits;
  }
}
