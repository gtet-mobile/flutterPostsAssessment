import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see {"Select a UserId"} dropDown
Future<void> iSeeDropdown(WidgetTester tester, String expectedText) async {
  final dropDownFinder = find.byKey(Key(expectedText));

  // Assert that the Dropdown widget with the expected text is found
  expect(dropDownFinder, findsOneWidget, reason: 'Expected to find a DropDown with the text "$expectedText" but found none.');
}
