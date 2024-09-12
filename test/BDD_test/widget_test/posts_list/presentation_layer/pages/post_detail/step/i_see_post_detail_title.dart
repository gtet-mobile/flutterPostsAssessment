import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see post detail Title
Future<void> iSeePostDetailTitle(WidgetTester tester) async {
  expect(find.byKey(const Key('PostDetailTitle')), findsOneWidget);
}