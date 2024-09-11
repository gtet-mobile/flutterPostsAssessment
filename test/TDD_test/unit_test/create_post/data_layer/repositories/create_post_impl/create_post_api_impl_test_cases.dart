import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:posts/features/create_post/data_layer/repositories/create_repo_impl/create_repo_impl.dart';
import 'package:posts/features/create_post/domain_layer/use_cases/create_post_use_case.dart';
import 'package:posts/features/posts_lists/data_layer/repositories/posts_repo_impl/posts_repo_impl.dart';
import 'package:posts/features/posts_lists/domain_layer/models/generic_model.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import 'create_post_api_impl_test_cases.mocks.dart';

@GenerateMocks([CreatePostRepositoryImpl])
void main() {
  group('CreatePostUseCase', () {
    late CreatePostUseCase createPostUseCase;
    late MockCreatePostRepositoryImpl mockPostApi;

    setUp(() {
      mockPostApi = MockCreatePostRepositoryImpl();
      createPostUseCase = CreatePostUseCase(mockPostApi);

      // Provide a dummy value for Result<List<PostModel>>
      provideDummy<Result<PostModel>>(
          Success(PostModel(userId: 0, title: '', body: '', id: 0)));
    });

    group('Create Post Api', () {
      const title = 'Testing';
      const subtitle = 'Testing Subtitle';
      const userId = 1;

      test('Failure creating post', () async {
        // Given
        when(mockPostApi.createPost(
                title: 'Error', subtitle: subtitle, userId: 0))
            .thenAnswer(
                (_) async => Failure(ErrorType.backendError, "Failure"));

        // Act & Assert
        expect(
            () => createPostUseCase.call(
                title: 'Error', subtitle: subtitle, userId: 0),
            throwsException);
        // Verify that getPosts() is called once
        verify(mockPostApi.createPost(title: 'Error', subtitle: subtitle, userId: 0)).called(1);
      });

      test('Successfully Created Post', () async {
        final PostModel postList =
            PostModel(title: 'Test Post', userId: 1, body: '', id: 1);
        final PostModel expectedMockPosts = postList;
        provideDummy<Result<PostModel>>(
          Success(expectedMockPosts),
        );
        when(mockPostApi.createPost(
                title: title, subtitle: subtitle, userId: userId))
            .thenAnswer((_) async => Success(expectedMockPosts));

        // Act
        final posts = await createPostUseCase.call(
            title: title, subtitle: subtitle, userId: userId);

        // Assert
        verify(mockPostApi.createPost(
                title: title, subtitle: subtitle, userId: userId))
            .called(1);
        expect(posts, postList); // Compare the actual post data
      });
    });
  });
}
