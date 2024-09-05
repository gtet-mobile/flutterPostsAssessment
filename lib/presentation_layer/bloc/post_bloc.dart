import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain_layer/models/post_model.dart';
import '../../domain_layer/use_cases/posts_view_model.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostViewModel postViewModel;

  PostBloc({required this.postViewModel}) : super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(
      LoadPosts event, Emitter<PostState> emit) async {
    emit(PostLoading()); // Emit loading state

    try {
      final posts = await postViewModel.fetchPosts();
      emit(PostLoaded(posts: posts)); // Emit loaded state
    } catch (error) {
      emit(PostError(message: error.toString())); // Emit error state
    }
  }
}

