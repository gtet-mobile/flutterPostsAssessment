import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/create_post/presentation_layer/create_post_bloc/create_post_bloc.dart';
import 'package:posts/service_locator.dart';
import 'features/create_post/data_layer/repositories/create_repo_impl/create_repo_impl.dart';
import 'features/create_post/domain_layer/use_cases/create_post_use_case.dart';
import 'features/posts_lists/data_layer/repositories/posts_repo_impl/posts_repo_impl.dart';
import 'features/posts_lists/domain_layer/use_cases/posts_use_case.dart';
import 'features/posts_lists/presentation_layer/bloc/post_bloc.dart';
import 'features/posts_lists/presentation_layer/pages/posts_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(
            postListsUseCase:
                PostsListUseCase(serviceLocator.get<PostsRepositoryImpl>()),
          ),
        ),
        BlocProvider(
          create: (context) => CreatePostBloc(
              createPostUseCase: CreatePostUseCase(
                  serviceLocator.get<CreatePostRepositoryImpl>()),
              postBloc: context.read<PostBloc>()),
        ),
      ],
      child: const MaterialApp(
        home: PostsPage(),
      ),
    );
  }
}
