import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import 'package:posts/features/posts_lists/domain_layer/use_cases/posts_use_case.dart';
import 'package:posts/features/posts_lists/presentation_layer/bloc/post_bloc.dart';

// Mocking the PostsListUseCase using Mockito
import 'posts_list_bloc_unit_test_cases.mocks.dart';

@GenerateMocks([PostsListUseCase])
void main() {
  late PostBloc postBloc;
  late MockPostsListUseCase mockPostsListUseCase;

  setUp(() {
    mockPostsListUseCase = MockPostsListUseCase();
    postBloc = PostBloc(postListsUseCase: mockPostsListUseCase);
  });

  group('PostBloc', () {
    final List<PostModel> mockPosts = [
      PostModel(userId: 1, id: 1, title: 'Test Title 1', body: 'Test Body 1'),
      PostModel(userId: 2, id: 2, title: 'Test Title 2', body: 'Test Body 2'),
    ];

    test('initial state is PostInitial', () {
      expect(postBloc.state, PostInitial());
    });

    blocTest<PostBloc, PostState>(
      'emits [PostLoading, PostLoaded] when LoadPosts is called successfully',
      build: () {
        when(mockPostsListUseCase.call()).thenAnswer((_) async => mockPosts);
        return postBloc;
      },
      act: (bloc) => bloc.add(LoadPosts()),
      expect: () => [
        PostLoading(),
        PostLoaded(posts: mockPosts),
      ],
      verify: (_) {
        verify(mockPostsListUseCase.call()).called(1);
      },
    );

    blocTest<PostBloc, PostState>(
      'emits [PostLoading, PostError] when LoadPosts fails',
      build: () {
        when(mockPostsListUseCase.call()).thenThrow(Exception('Failed to load posts'));
        return postBloc;
      },
      act: (bloc) => bloc.add(LoadPosts()),
      expect: () => [
        PostLoading(),
        PostError(message: 'Exception: Failed to load posts'),
      ],
      verify: (_) {
        verify(mockPostsListUseCase.call()).called(1);
      },
    );
  });
}
