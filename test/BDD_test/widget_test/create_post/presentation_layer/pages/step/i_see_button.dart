import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {"submit"} button
Future<void> iSeeButton(WidgetTester tester, String buttonText) async {
  expect(find.widgetWithText(ElevatedButton, buttonText), findsOneWidget);
}
