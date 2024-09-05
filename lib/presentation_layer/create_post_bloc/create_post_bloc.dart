import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain_layer/use_cases/posts_view_model.dart';

part 'create_post_event.dart';

part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc({required this.postViewModel}) : super(CreatePostInitial()) {
    on<SubmitPost>(onSubmitPost);
  }

  final PostViewModel postViewModel;

  Future<void> onSubmitPost(
      SubmitPost event, Emitter<CreatePostState> emit) async {
    emit(AddPostSubmitting()); // Emit submitting state

    try {
      // Use the postViewModel to create a new post
      await postViewModel.createPost(
        title: event.title,
        subtitle: event.subtitle,
        userId: event.userId,
      );
      emit(AddPostSuccess()); // Emit success state
    } catch (error) {
      emit(AddPostFailure(
          error.toString())); // Emit failure state in case of exception
    }
  }
}
