import '../../../../../posts_lists/domain_layer/models/generic_model.dart';
import '../../../../../posts_lists/domain_layer/models/post_model.dart';

abstract class AbstractCreatePostApi {
  // Get all article
  Future<Result<PostModel>> createPost(
      String title, String subtitle, int userId) {
    throw UnimplementedError();
  }
}