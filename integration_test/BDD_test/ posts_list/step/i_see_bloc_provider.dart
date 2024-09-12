import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see Bloc Provider
Future<void> iSeeBlocProvider(WidgetTester tester) async {
  expect(find.byKey(const Key("PostsPageBlocProvider")), findsOneWidget);
  await tester.pumpAndSettle();
}
