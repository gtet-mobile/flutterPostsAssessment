import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/create_post/data_layer/repositories/create_repo_impl/create_repo_impl.dart';
import 'package:posts/features/create_post/domain_layer/use_cases/create_post_use_case.dart';
import 'package:posts/features/posts_lists/domain_layer/use_cases/posts_use_case.dart';
import 'package:posts/service_locator.dart';
import '../../../create_post/presentation_layer/create_post_bloc/create_post_bloc.dart';
import '../../../create_post/presentation_layer/pages/add_post.dart';
import '../../data_layer/repositories/posts_repo_impl/posts_repo_impl.dart';
import '../../domain_layer/models/post_model.dart';
import '../bloc/post_bloc.dart';
import '../widgets/post_list_item.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    // Initialize the bloc and load posts when the screen is first created
    _postBloc = PostBloc(
      postListsUseCase: PostsListUseCase(
        serviceLocator.get<PostsRepositoryImpl>(),
      ),
    );

    // Trigger the LoadPosts event to load the posts initially
    _postBloc.add(LoadPosts());
  }

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lists of posts", key: Key("HeaderTitle"),),
      ),
      body: BlocProvider(
        key: const Key("PostsPageBlocProvider"),
        create: (_) => _postBloc,
        child: BlocBuilder<PostBloc, PostState>(
          key: const Key("PostsPageBlocBuilder"),
          builder: (context, state) {
            if (state is PostLoading) {
              print(
                  'PostLoading state detected'); // Log to check if this state is hit

              return const Center(child: CircularProgressIndicator(key: Key("PostsPageLoadingIndicator"),));
            } else if (state is PostLoaded) {
              if (state.posts.isEmpty) {
                print("jhgjhgj9");
                return const Center(child: Text('No posts available'));
              }

              return RefreshIndicator(
                key: const Key("PostsPageRefreshIndicator"),
                onRefresh: () async {
                  if (state is! PostLoading) {
                    // Trigger manual refresh of posts list only if not already loading
                    if (context.read<PostBloc>().addedPost.body == '') {
                      context.read<PostBloc>().add(LoadPosts());
                    } else {
                      _postBloc.add(UpdatePostsList(
                          newPost: context.read<PostBloc>().addedPost));
                    }
                  }
                },
                child: ListView.builder(
                  key: const Key("PostsPageList"),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return GestureDetector(
                      onTap: () {
                        showPostDetailDialog(context, post);
                      },
                      child: PostListItem(
                    key: Key('list_item_$index'), // Assign a key to each item
                        post: post,
                      ),
                    );
                  },
                ),
              );
            } else if (state is PostError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${state.message}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Retry loading posts
                        context.read<PostBloc>().add(LoadPosts());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => CreatePostBloc(
                              createPostUseCase: CreatePostUseCase(
                                  serviceLocator
                                      .get<CreatePostRepositoryImpl>()),
                              postBloc: context.read<PostBloc>()),
                          child: const AddPost(),
                        ))).then((_) {
              // Reload the posts list when returning from the AddPost screen
              if (context.read<PostBloc>().addedPost.body == '') {
                context.read<PostBloc>().add(LoadPosts());
              } else {
                _postBloc.add(UpdatePostsList(
                    newPost: context.read<PostBloc>().addedPost));
              }
            });
          }),
    );
  }

  void showPostDetailDialog(BuildContext context, PostModel post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          key: const Key("PostDetailAlertView"),
          title: Text('User ID: ${post.userId}', key: const Key("PostDetailId"),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                key: const Key("PostDetailTitle"),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              Text('Subtitle: ${post.body}', key: const Key("PostDetailBody"),),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
