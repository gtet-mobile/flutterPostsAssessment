import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/features/posts_lists/presentation_layer/bloc/post_bloc.dart';

/// Usage: I see Bloc Builder
Future<void> iSeeBlocBuilder(WidgetTester tester) async {
  expect(
    find.byKey(const Key("PostsPageBlocBuilder")
    ),
    findsOneWidget,
  );
  await tester.pumpAndSettle();
}
