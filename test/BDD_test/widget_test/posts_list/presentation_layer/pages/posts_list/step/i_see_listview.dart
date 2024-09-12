import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see ListView
Future<void> iSeeListview(WidgetTester tester) async {
  expect(find.byType(ListView), findsOneWidget);
}
