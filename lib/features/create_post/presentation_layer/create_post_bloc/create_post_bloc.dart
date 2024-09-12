import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../posts_lists/presentation_layer/bloc/post_bloc.dart';
import '../../domain_layer/use_cases/create_post_use_case.dart';
import 'package:equatable/equatable.dart';
part 'create_post_state.dart';
part 'create_post_event.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc({required this.postBloc, required this.createPostUseCase})
      : super(CreatePostInitial()) {
    on<ValidatePost>(onValidateForm);
    on<SubmitPost>(onSubmitPost);
  }

  final PostBloc postBloc; // Add a reference to PostBloc
  final CreatePostUseCase createPostUseCase;

  Future<void> onSubmitPost(
      SubmitPost event, Emitter<CreatePostState> emit) async {
    emit(AddPostSubmitting()); // Emit submitting state
    try {
      // Use the postViewModel to create a new post
      final result = await createPostUseCase.call(
        title: event.title,
        subtitle: event.subtitle,
        userId: event.userId,
      );
      // Notify PostBloc to update its posts list
      postBloc.add(UpdatePostsList(newPost: result)); // Add the new post to PostBloc      postBloc.add(LoadPosts()); // This will reload the posts list in the PostsPage
      emit(AddPostSuccess()); // Emit success state
    } catch (error) {
      emit(AddPostFailure(
          error.toString())); // Emit failure state in case of exception
    }
  }

  void onValidateForm(ValidatePost event, Emitter<CreatePostState> emit) {
    final isFormValid = event.title.isNotEmpty &&
        event.subtitle.isNotEmpty &&
        event.userId != 0;
    emit(IsSubmitBtnEnabled(isFormValid));
  }

}
