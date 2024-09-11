import 'package:get_it/get_it.dart';
import 'features/create_post/create_post_sl.dart';
import 'features/posts_lists/posts_list_sl.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceProvider() async {
  initCreatePostSP();
  initPostsListSP();
}
