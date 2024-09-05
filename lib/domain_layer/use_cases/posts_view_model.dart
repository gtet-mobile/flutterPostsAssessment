import 'package:posts/data_layer/post_repository/post_api.dart';
import '../models/generic_model.dart';
import '../models/post_model.dart';

class PostViewModel {
  final PostApi postApi;

  PostViewModel(this.postApi);

  Future<List<PostModel>> fetchPosts() async {
    final result = await postApi.getPosts();
    if (result is Success<List<PostModel>>) {
      return result.data;
    } else {
      // Handle failure scenario
      throw Exception("Failed to load posts");
    }
  }

  Future<PostModel> createPost({title, subtitle, userId}) async {
    final result = await postApi.createPost(title, subtitle, userId);
    if (result is Success<PostModel>) {
      return result.data;
    } else {
      // Handle failure scenario
      throw Exception("Failed to load posts");
    }
  }
}
