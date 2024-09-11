import 'package:posts/features/create_post/data_layer/data_sources/remote/create_post/create_post_api_impl.dart';
import '../../../../posts_lists/domain_layer/models/generic_model.dart';
import '../../../../posts_lists/domain_layer/models/post_model.dart';
import '../../../domain_layer/repositories/create_post_repository/create_post_repository.dart';

class CreatePostRepositoryImpl extends AbstractCreatePostRepository {
  final CreatePostApiImpl createPostApi;

  CreatePostRepositoryImpl(
      this.createPostApi,
      );

  @override
  Future<Result<PostModel>> createPost({title, subtitle, userId}) async {
    final result = await createPostApi.createPost(title, subtitle, userId);
    if (result is Success<PostModel>) {
      return result;
    } else {
      // Handle failure scenario
      throw Exception("Failed to load posts");
    }
  }
}