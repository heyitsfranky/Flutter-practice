import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_app/post_model.dart';

class HttpService {
  final Uri postsUrl = Uri.https("jsonplaceholder.typicode.com", "posts");

  Future<void> deletePost(int id) async {
    String newUrlString = '${postsUrl.path}/$id';
    Uri newUrl = Uri.https(postsUrl.host, newUrlString);
    Response res = await delete(newUrl);
    if (res.statusCode == 200) {
      print("Deleted!");
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(postsUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
