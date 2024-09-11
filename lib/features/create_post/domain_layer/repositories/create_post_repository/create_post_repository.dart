import '../../../../posts_lists/domain_layer/models/generic_model.dart';
import '../../../../posts_lists/domain_layer/models/post_model.dart';

abstract class AbstractCreatePostRepository {
  // Gent Ny Times Articles
  Future<Result<PostModel>> createPost({title, subtitle, userId}) {
    throw UnimplementedError();
  }
}