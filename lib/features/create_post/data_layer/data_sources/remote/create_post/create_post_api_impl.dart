import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../posts_lists/domain_layer/models/generic_model.dart';
import '../../../../../posts_lists/domain_layer/models/post_model.dart';
import 'create_post_api.dart';

class CreatePostApiImpl extends AbstractCreatePostApi {
  final http.Client client;

  CreatePostApiImpl(this.client);

  @override
  Future<Result<PostModel>> createPost(
      String title, String subtitle, int userId) async {
    try {
      final response = await client.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          'title': title,
          'body': subtitle,
          'userId': userId,
        }),
      );
      if (response.statusCode == 201) {
        // Parsing the response body to a PostModel
        PostModel responseModelData =
        PostModel.fromJson(json.decode(response.body));
        return Success<PostModel>(responseModelData);
      } else {
        return Failure.errorResponse("Failed to create post.");
      }
    } catch (e) {
      return Failure.errorResponse(e.toString());
    }
  }
}