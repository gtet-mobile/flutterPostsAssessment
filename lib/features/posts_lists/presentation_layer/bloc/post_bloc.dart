import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/create_post/presentation_layer/create_post_bloc/create_post_bloc.dart';
import '../../domain_layer/models/post_model.dart';
import '../../domain_layer/use_cases/posts_use_case.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsListUseCase postListsUseCase;
  PostModel addedPost = PostModel(userId: 0, id: 0, title: '', body: '');

  PostBloc({required this.postListsUseCase}) : super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<UpdatePostsList>(
        _onUpdatePostsList); // Add event handler for updating the list
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostState> emit) async {
    emit(PostLoading()); // Emit loading state
    try {
      final posts = await postListsUseCase.call();
      emit(PostLoaded(posts: posts)); // Emit loaded state
    } catch (error) {
      emit(PostError(message: error.toString())); // Emit error state
    }
  }

  void _onUpdatePostsList(
      UpdatePostsList event, Emitter<PostState> emit) async {
    emit(PostLoading()); // Emit loading state
    try {
      final updatedPosts = event.newPost;
      addedPost = event.props;
      final posts = await postListsUseCase.call();
      posts.insert(0, updatedPosts);
      // posts.add(updatedPosts);
      emit(PostLoaded(posts: posts)); // Emit loaded state
    } catch (error) {
      emit(PostError(message: error.toString())); // Emit error state
    }
  }
}
