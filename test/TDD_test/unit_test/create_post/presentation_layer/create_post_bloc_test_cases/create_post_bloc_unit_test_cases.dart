import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:posts/features/create_post/domain_layer/use_cases/create_post_use_case.dart';
import 'package:posts/features/create_post/presentation_layer/create_post_bloc/create_post_bloc.dart';
import 'package:posts/features/posts_lists/domain_layer/models/generic_model.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';
import 'package:posts/features/posts_lists/presentation_layer/bloc/post_bloc.dart';
import '../../../posts_list/presentation_layer/posts_list_bloc_test_cases/posts_list_bloc_unit_test_cases.mocks.dart';
import 'create_post_bloc_unit_test_cases.mocks.dart';

@GenerateMocks([CreatePostUseCase])
void main() {
  group('CreatePostBloc', () {
    late CreatePostBloc createPostBloc;
    late MockCreatePostUseCase mockCreatePostUseCase;
    late PostBloc postBloc;
    late MockPostsListUseCase mockPostsListUseCase;

    setUp(() {
      mockPostsListUseCase = MockPostsListUseCase();
      postBloc = PostBloc(postListsUseCase: mockPostsListUseCase);
      mockCreatePostUseCase = MockCreatePostUseCase();
      createPostBloc = CreatePostBloc(createPostUseCase: mockCreatePostUseCase, postBloc: postBloc);
    });
    // Provide a dummy value for Result<List<PostModel>>
    provideDummy<Result<PostModel>>(
        Success(PostModel(userId: 0, title: '', body: '', id: 0)));
    test('initial state should be CreatePostInitial', () {
      expect(createPostBloc.state, CreatePostInitial());
    });

    group('onValidateForm', () {
      blocTest<CreatePostBloc, CreatePostState>(
        'emits IsSubmitBtnEnabled(true) when ValidatePost event is added with valid data',
        build: () => createPostBloc,
        act: (bloc) => bloc.add(ValidatePost(title: 'title', subtitle: 'subtitle', userId: 1)),
        expect: () => [IsSubmitBtnEnabled(true)],
      );

      blocTest<CreatePostBloc, CreatePostState>(
        'emits IsSubmitBtnEnabled(false) when ValidatePost event is added with invalid data',
        build: () => createPostBloc,
        act: (bloc) => bloc.add(ValidatePost(title: '', subtitle: 'subtitle', userId: 1)),
        expect: () => [IsSubmitBtnEnabled(false)],
      );
    });

    group('onSubmitPost', () {
      blocTest<CreatePostBloc, CreatePostState>(
        'emits AddPostSubmitting and then AddPostSuccess when SubmitPost event is added and call is successful',
        build: () {
          when(mockCreatePostUseCase.call(
            title: 'title',
            subtitle: 'subtitle',
            userId: 1,
          )).thenAnswer((_) async => PostModel(userId: 1, title: "title", body: 'subtitle',id: 101));

          return createPostBloc;
        },
        act: (bloc) => bloc.add(SubmitPost(title: 'title', subtitle: 'subtitle', userId: 1)),
        expect: () => [
          AddPostSubmitting(),
          AddPostSuccess(),
        ],
      );

      blocTest<CreatePostBloc, CreatePostState>(
        'emits AddPostSubmitting and then AddPostFailure when SubmitPost event is added and call fails',
        build: () {
          when(mockCreatePostUseCase.call(
            title: 'title',
            subtitle: 'subtitle',
            userId: 1,
          )).thenThrow(Exception('Failed to create post'));

          return createPostBloc;
        },
        act: (bloc) => bloc.add(SubmitPost(title: 'title', subtitle: 'subtitle', userId: 1)),
        expect: () => [
          AddPostSubmitting(),
          AddPostFailure('Exception: Failed to create post'),
        ],
      );
    });
  });
}