part of 'post_bloc.dart';

sealed class PostEvent {
  @override
  Object get props => [];
}

class LoadPosts extends PostEvent {
}

class UpdatePostsList extends PostEvent {
  final PostModel newPost;

  UpdatePostsList({required this.newPost});
  @override
  PostModel get props => newPost;
}