import 'package:http/http.dart' as http;
import '../../service_locator.dart';
import 'data_layer/data_sources/remote/posts/posts_impl.dart';
import 'data_layer/repositories/posts_repo_impl/posts_repo_impl.dart';
import 'domain_layer/use_cases/posts_use_case.dart';

Future<void> initPostsListSP() async {
  serviceLocator.registerLazySingleton<PostsListApiImpl>(
          () => PostsListApiImpl(http.Client()));

  serviceLocator.registerLazySingleton<PostsRepositoryImpl>(
          () => PostsRepositoryImpl(serviceLocator.get<PostsListApiImpl>()));

  serviceLocator.registerLazySingleton<PostsListUseCase>(
          () => PostsListUseCase(serviceLocator.get<PostsRepositoryImpl>()));
}