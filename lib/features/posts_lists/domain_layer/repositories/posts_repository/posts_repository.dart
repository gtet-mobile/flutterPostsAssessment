import '../../models/generic_model.dart';
import '../../models/post_model.dart';

abstract class AbstractPostsListRepository {
  // Gent Ny Times Articles
  Future<Result<List<PostModel>>> getPosts() {
    throw UnimplementedError();
  }
}