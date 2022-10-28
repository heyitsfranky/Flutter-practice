import 'package:flutter/material.dart';
import 'package:test_app/http_service.dart';
import 'package:test_app/post_model.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();
  PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () async {
          await httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text("Title"),
                  subtitle: Text(post.title),
                ),
                ListTile(
                  title: const Text("ID"),
                  subtitle: Text(post.id.toString()),
                ),
                ListTile(
                  title: const Text("Body"),
                  subtitle: Text(post.body),
                ),
                ListTile(
                  title: const Text("User ID"),
                  subtitle: Text("${post.userId}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
