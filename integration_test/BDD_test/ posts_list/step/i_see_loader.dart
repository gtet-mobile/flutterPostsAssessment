import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see Loader
Future<void> iSeeLoader(WidgetTester tester) async {
  expect(find.byKey(const Key("PostsPageLoadingIndicator")), findsOneWidget);
  await tester.pump();
}
