import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see Header Title
Future<void> iSeeHeaderTitle(WidgetTester tester) async {
  expect(find.byKey(const Key("HeaderTitle")), findsOneWidget);
}
