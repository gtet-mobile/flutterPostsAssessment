import '../../../../domain_layer/models/generic_model.dart';
import '../../../../domain_layer/models/post_model.dart';

abstract class AbstractPostsListApi {
  // Get all article
  Future<Result<List<PostModel>>> getPostsList() {
    throw UnimplementedError();
  }
}