import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:posts/features/create_post/data_layer/data_sources/remote/create_post/create_post_api_impl.dart';
import 'package:posts/features/posts_lists/domain_layer/models/generic_model.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import '../../../repositories/create_post_impl/create_post_api_impl_test_cases.mocks.dart';
import 'create_post_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late CreatePostApiImpl api;
  late MockClient mockCreatePostRepositoryImpl;

  setUp(() {
    mockCreatePostRepositoryImpl = MockClient();
    api = CreatePostApiImpl(mockCreatePostRepositoryImpl);
  });

  group('CreatePostApiImpl', () {
    const title = 'Test Title';
    const subtitle = 'Test Subtitle';
    const userId = 1;

    test('returns Success<PostModel> when the API call completes successfully', () async {
      // Arrange
      final mockResponse = {
        'id': 101,
        'title': title,
        'body': subtitle,
        'userId': userId
      };
      when(mockCreatePostRepositoryImpl.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(json.encode(mockResponse), 201));

      // Act
      final result = await api.createPost(title, subtitle, userId);

      // Assert
      expect(result, isA<Success<PostModel>>());
      expect((result as Success<PostModel>).data.title, title);
      expect(result.data.body, subtitle);
    });

    test('returns Failure when the API call fails with non-201 status code', () async {
      // Arrange
      when(mockCreatePostRepositoryImpl.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Failed to create post.', 400));

      // Act
      final result = await api.createPost(title, subtitle, userId);

      // Assert
      expect(result, isA<Failure>());
      expect((result as Failure).errorMessage, 'Failed to create post.');
    });

    test('returns Failure when there is an exception during the API call', () async {
      // Arrange
      when(mockCreatePostRepositoryImpl.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenThrow(Exception('Network error'));

      // Act
      final result = await api.createPost(title, subtitle, userId);

      // Assert
      expect(result, isA<Failure>());
      expect((result as Failure).errorMessage, contains('Network error'));
    });
  });
}
