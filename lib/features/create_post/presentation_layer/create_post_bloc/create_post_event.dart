part of 'create_post_bloc.dart';

@immutable
sealed class CreatePostEvent {}

class SubmitPost extends CreatePostEvent {
  final String title;
  final String subtitle;
  final int userId;

  SubmitPost({
    required this.title,
    required this.subtitle,
    required this.userId,
  });
}

class ValidatePost extends CreatePostEvent {
  final String title;
  final String subtitle;
  final int userId;

  ValidatePost({
    required this.title,
    required this.subtitle,
    required this.userId,
  });
}