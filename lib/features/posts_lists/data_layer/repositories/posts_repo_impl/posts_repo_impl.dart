import '../../../domain_layer/models/generic_model.dart';
import '../../../domain_layer/models/post_model.dart';
import '../../../domain_layer/repositories/posts_repository/posts_repository.dart';
import '../../data_sources/remote/posts/posts_impl.dart';

class PostsRepositoryImpl extends AbstractPostsListRepository {
  final PostsListApiImpl postsListApi;

  PostsRepositoryImpl(
    this.postsListApi,
  );

  @override
  Future<Result<List<PostModel>>> getPosts() async {
    final result = await postsListApi.getPostsList();
    if (result is Success<List<PostModel>>) {
      return result;
    } else {
      // Handle failure scenario
      throw Exception("Failed to load posts");
    }
  }
}
