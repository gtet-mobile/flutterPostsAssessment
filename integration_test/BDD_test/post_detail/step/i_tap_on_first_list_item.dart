import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap on first List Item
Future<void> iTapOnFirstListItem(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 1));
  final firstItem = find.byKey(const Key('list_item_0'));
  expect(firstItem, findsOneWidget);
  await tester.tap(firstItem);
  await tester.pump(const Duration(seconds: 1));

}
