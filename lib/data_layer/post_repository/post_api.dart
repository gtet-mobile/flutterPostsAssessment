import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../domain_layer/models/generic_model.dart';
import '../../domain_layer/models/post_model.dart';

class PostApi {
  final http.Client client;

  PostApi(this.client);

  Future<Result<List<PostModel>>> getPosts() async {
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
