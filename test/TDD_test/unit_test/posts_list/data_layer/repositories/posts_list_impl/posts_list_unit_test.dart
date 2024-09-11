import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:posts/features/posts_lists/data_layer/repositories/posts_repo_impl/posts_repo_impl.dart';
import 'package:posts/features/posts_lists/domain_layer/models/generic_model.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import 'package:posts/features/posts_lists/domain_layer/use_cases/posts_use_case.dart';
import 'posts_list_unit_test.mocks.dart';

@GenerateMocks([PostsRepositoryImpl])
void main() {
  group('PostListsUseCase', () {
    late PostsListUseCase postListsUseCase;
    late MockPostsRepositoryImpl mockPostApi;

    setUp(() {
      mockPostApi = MockPostsRepositoryImpl();
      postListsUseCase = PostsListUseCase(mockPostApi);

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
        final posts = await postListsUseCase.call();

        // Assert
        verify(mockPostApi.getPosts()).called(1);
        expect(posts, postList); // Compare the actual post data
      });

      test('Failure fetching posts', () async {
        // Given
        when(mockPostApi.getPosts())
            .thenAnswer((_) async => Failure(ErrorType.backendError, "Failure"));

        // Act & Assert
        expect(() => postListsUseCase.call(), throwsException);
        // Verify that getPosts() is called once
        verify(mockPostApi.getPosts()).called(1);
      });

    });
  });
}

