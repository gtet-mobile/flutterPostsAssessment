import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap {"Submit"} button
Future<void> iTapButton(WidgetTester tester, String buttonText) async {
  expect(find.widgetWithText(ElevatedButton, buttonText), findsOneWidget);
  await tester.tap(find.text("Submit"));
  await tester.pumpAndSettle(const Duration(seconds: 3));
}
