import 'package:flutter/material.dart';
import 'package:test_app/http_service.dart';
import 'package:test_app/post_model.dart';
import 'package:test_app/postdetail_page.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    return Scaffold(
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post>? posts = snapshot.data;

              return ListView(
                children: posts!
                    .map(
                      (Post post) => ListTile(
                        title: Text(post.title),
                        subtitle: Text(
                          post.id.toString(),
                        ),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostDetailPage(post: post),
                        )),
                      ),
                    )
                    .toList(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
