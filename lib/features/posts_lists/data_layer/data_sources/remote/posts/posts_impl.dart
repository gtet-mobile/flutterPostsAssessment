import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:posts/features/posts_lists/data_layer/data_sources/remote/posts/posts_api.dart';
import '../../../../domain_layer/models/generic_model.dart';
import '../../../../domain_layer/models/post_model.dart';

class PostsListApiImpl extends AbstractPostsListApi {
  final http.Client client;

  PostsListApiImpl(this.client);

  @override
  Future<Result<List<PostModel>>> getPostsList() async {
    try {
      final response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        // Parsing the response body as a List and mapping to AssessmentModel
        List<PostModel> responseModelData = (json.decode(response.body) as List)
            .map((post) => PostModel.fromJson(post))
            .toList();
        return Success<List<PostModel>>(responseModelData);
      } else {
        return Failure.errorResponse("Failed to fetch posts.");
      }
    } catch (e) {
      return Failure.errorResponse(e.toString());
    }
  }
}