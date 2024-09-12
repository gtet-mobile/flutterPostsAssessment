import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see first List Item
Future<void> iSeeFirstListItem(WidgetTester tester) async {
  final firstItem = find.byKey(const Key('list_item_0'));
  expect(firstItem, findsOneWidget);}
