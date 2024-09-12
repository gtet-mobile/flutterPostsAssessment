part of 'create_post_bloc.dart';

@immutable
abstract class CreatePostState extends Equatable {
  @override
  List<Object> get props => [];
}
class CreatePostInitial extends CreatePostState {}

class AddPostSubmitting extends CreatePostState {}

class AddPostSuccess extends CreatePostState {}

class AddPostFailure extends CreatePostState {
  final String errorMessage;

  AddPostFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class IsSubmitBtnEnabled extends CreatePostState {
  final bool isEnabled;

  IsSubmitBtnEnabled(this.isEnabled);

  @override
  List<Object> get props => [isEnabled];
}
