import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:posts/presentation_layer/pages/add_post.dart';
import 'package:posts/presentation_layer/pages/posts_list.dart';
import '../../data_layer/post_repository/post_api.dart';
import '../../domain_layer/use_cases/posts_view_model.dart';
import '../bloc/post_bloc.dart';
import '../create_post_bloc/create_post_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PostBloc(
          postViewModel: PostViewModel(PostApi(http.Client())),
        )..add(LoadPosts()),
        child: const PostsList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => CreatePostBloc(
                              postViewModel:
                                  PostViewModel(PostApi(http.Client()))),
                          child: const AddPost(),
                        )));
          }),
    );
  }
}
