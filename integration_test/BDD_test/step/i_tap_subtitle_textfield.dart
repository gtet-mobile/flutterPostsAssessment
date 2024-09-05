import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap {"SubTitle"} subtitle textField
Future<void> iTapSubtitleTextfield(
    WidgetTester tester, String expectedKey, String expectedText) async {
  // Find the text field using the provided key
  final textFieldFinder = find.widgetWithText(TextField, expectedKey);

  // Ensure the text field is found
  expect(textFieldFinder, findsOneWidget,
      reason:
          'Expected to find a TextField with the text "$expectedText" but found none.');

  // Tap on the text field to focus it
  await tester.tap(textFieldFinder);
  await tester
      .pumpAndSettle(); // Wait for the tap and any animations to complete

  // Enter text "Testing Integration Test"
  await tester.enterText(textFieldFinder, expectedText);
  await tester.pumpAndSettle(); // Wait for the text to be entered
}
