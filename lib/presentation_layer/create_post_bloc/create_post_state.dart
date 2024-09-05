part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}

class AddPostSubmitting extends CreatePostState {}

class AddPostSuccess extends CreatePostState {}

class AddPostFailure extends CreatePostState {
  final String error;

  AddPostFailure(this.error);
}