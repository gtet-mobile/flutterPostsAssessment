import 'package:posts/features/posts_lists/domain_layer/models/generic_model.dart';
import 'package:posts/features/posts_lists/domain_layer/repositories/posts_repository/posts_repository.dart';
import '../models/post_model.dart';

class PostsListUseCase {
  final AbstractPostsListRepository postsListRepository;

  PostsListUseCase(this.postsListRepository);

  Future<List<PostModel>> call() async {
    final result = await postsListRepository.getPosts();
    if (result is Success<List<PostModel>>) {
      return result.data;
    } else {
      throw Exception("Error is there");
    }
  }
}
