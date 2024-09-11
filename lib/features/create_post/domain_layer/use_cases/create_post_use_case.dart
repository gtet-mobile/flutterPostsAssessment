import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import '../../../posts_lists/domain_layer/models/generic_model.dart';
import '../repositories/create_post_repository/create_post_repository.dart';

class CreatePostUseCase {
  final AbstractCreatePostRepository createPostRepository;

  CreatePostUseCase(this.createPostRepository);

  Future<PostModel> call(
      {title, subtitle, userId}) async {
    final result = await createPostRepository.createPost(title: title, subtitle: subtitle, userId: userId);
    if (result is Success<PostModel>) {
      return result.data;
    } else {
      throw Exception("Failure");
    }
  }
}
