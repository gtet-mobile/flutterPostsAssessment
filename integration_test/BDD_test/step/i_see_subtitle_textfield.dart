import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {"SubTitle"} subtitle textField
Future<void> iSeeSubtitleTextfield(WidgetTester tester, String expectedText) async {
  final textFieldFinder = find.widgetWithText(TextField, expectedText);

  // Assert that the TextField widget with the expected text is found
  expect(textFieldFinder, findsOneWidget, reason: 'Expected to find a TextField with the text "$expectedText" but found none.');
}
