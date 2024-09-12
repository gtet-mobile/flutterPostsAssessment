import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see ListView
Future<void> iShouldSeeListview(WidgetTester tester) async {
  await tester.pumpAndSettle();
  expect(find.byType(ListView), findsOneWidget);
  await tester.pump();
}
