import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:posts/domain_layer/models/generic_model.dart';
import 'package:posts/domain_layer/models/post_model.dart';
import 'package:posts/domain_layer/use_cases/posts_view_model.dart';
import 'package:posts/data_layer/post_repository/post_api.dart';

import 'unit_test.mocks.dart';

@GenerateMocks([PostApi])
void main() {
  group('PostViewModel', () {
    late PostViewModel viewModel;
    late MockPostApi mockPostApi;

    setUp(() {
      mockPostApi = MockPostApi();
      viewModel = PostViewModel(mockPostApi);

      // Provide a dummy value for Result<List<PostModel>>
      provideDummy<Result<List<PostModel>>>(Success([]));
    });

    group('Posts Api', () {
      test('Successfully fetching posts', () async {
        // Given
        final List<PostModel> postList = [
          PostModel(id: 1, title: 'Test Post', userId: 1, body: '')
        ];
        final Result<List<PostModel>> expectedMockPosts = Success(postList);
        provideDummy<Result<List<PostModel>>>(
          expectedMockPosts,
        );
        when(mockPostApi.getPosts()).thenAnswer((_) async => expectedMockPosts);

        // Act
        final posts = await viewModel.fetchPosts();

        // Assert
        verify(mockPostApi.getPosts()).called(1);
        expect(posts, postList); // Compare the actual post data
      });

      test('Failure fetching posts', () async {
        // Given
        when(mockPostApi.getPosts())
            .thenAnswer((_) async => Failure(ErrorType.backendError, "Failure"));

        // Act & Assert
        expect(() => viewModel.fetchPosts(), throwsException);
        // Verify that getPosts() is called once
        verify(mockPostApi.getPosts()).called(1);
      });


      test('Successfully Created Post', () async {
        // Given
        const title = 'Testing';
        const subtitle = 'Testing Subtitle';
        const userId = 1;
        final PostModel postList =
        PostModel(title: 'Test Post', userId: 1, body: '', id: 1);
        final Result<PostModel> expectedMockPosts = Success(postList);
        provideDummy<Result<PostModel>>(
          expectedMockPosts,
        );
        when(mockPostApi.createPost(title, subtitle, userId)).thenAnswer((_) async => expectedMockPosts);

        // Act
        final posts = await viewModel.createPost(title: title,subtitle: subtitle,userId: userId);

        // Assert
        verify(mockPostApi.createPost(title, subtitle, userId)).called(1);
        expect(posts, postList); // Compare the actual post data
      });
    });
  });
}
