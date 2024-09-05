part of 'post_bloc.dart';

sealed class PostEvent {
  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {}

class CreatePost extends PostEvent {}
