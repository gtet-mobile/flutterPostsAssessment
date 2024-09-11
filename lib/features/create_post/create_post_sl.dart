import 'package:http/http.dart' as http;
import '../../service_locator.dart';
import 'data_layer/data_sources/remote/create_post/create_post_api_impl.dart';
import 'data_layer/repositories/create_repo_impl/create_repo_impl.dart';
import 'domain_layer/use_cases/create_post_use_case.dart';

Future<void> initCreatePostSP() async {
  serviceLocator.registerLazySingleton<CreatePostApiImpl>(
          () => CreatePostApiImpl(http.Client()));

  serviceLocator.registerLazySingleton<CreatePostRepositoryImpl>(
          () => CreatePostRepositoryImpl(serviceLocator.get<CreatePostApiImpl>()));

  serviceLocator.registerLazySingleton<CreatePostUseCase>(
          () => CreatePostUseCase(serviceLocator.get<CreatePostRepositoryImpl>()));
}