import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:posts/features/posts_lists/data_layer/data_sources/remote/posts/posts_impl.dart';
import 'package:posts/features/posts_lists/domain_layer/models/generic_model.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import 'posts_list_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late PostsListApiImpl api;
  late MockClient mockPostsListApiImpl;

  setUp(() {
    mockPostsListApiImpl = MockClient();
    api = PostsListApiImpl(mockPostsListApiImpl);
  });

  group('PostsListApiImpl', () {
    test('returns Success<List<PostModel>> when the API call completes successfully', () async {
      // Arrange
      final mockResponse = [
        {
          'userId': 1,
          'id': 1,
          'title': 'Test Title',
          'body': 'Test Body',
        },
        {
          'userId': 2,
          'id': 2,
          'title': 'Another Test Title',
          'body': 'Another Test Body',
        },
      ];

      when(mockPostsListApiImpl.get(
        any,
      )).thenAnswer((_) async => http.Response(json.encode(mockResponse), 200));

      // Act
      final result = await api.getPostsList();

      // Assert
      expect(result, isA<Success<List<PostModel>>>());
      final successResult = result as Success<List<PostModel>>;
      expect(successResult.data.length, 2);
      expect(successResult.data[0].title, 'Test Title');
      expect(successResult.data[1].title, 'Another Test Title');
    });

    test('returns Failure when the API call fails with a non-200 status code', () async {
      // Arrange
      when(mockPostsListApiImpl.get(any)).thenAnswer((_) async => http.Response('Error', 400));

      // Act
      final result = await api.getPostsList();

      // Assert
      expect(result, isA<Failure>());
      final failureResult = result as Failure;
      expect(failureResult.errorMessage, 'Failed to fetch posts.');
    });

    test('returns Failure when there is an exception during the API call', () async {
      // Arrange
      when(mockPostsListApiImpl.get(any)).thenThrow(Exception('Network error'));

      // Act
      final result = await api.getPostsList();

      // Assert
      expect(result, isA<Failure>());
      final failureResult = result as Failure;
      expect(failureResult.errorMessage, contains('Network error'));
    });
  });
}
