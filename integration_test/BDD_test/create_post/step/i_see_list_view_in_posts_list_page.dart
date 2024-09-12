import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see List View in Posts List Page
Future<void> iSeeListViewInPostsListPage(WidgetTester tester) async {
  await tester.pumpAndSettle();
  expect(find.byType(ListView), findsOneWidget);
  await tester.pump();
  expect(find.text("Successfully Posted"), findsOneWidget);
  await tester.pumpAndSettle(const Duration(seconds: 3));

}
