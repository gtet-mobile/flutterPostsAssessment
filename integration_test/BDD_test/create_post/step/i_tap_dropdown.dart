import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap {"Select a UserId"} dropDown
Future<void> iTapDropdown(WidgetTester tester, String dropDownKey) async {
  // Find the dropDown field using the provided key
  final dropDownFinder = find.byKey(Key(dropDownKey));

  // Ensure the dropdown field is found
  expect(dropDownFinder, findsOneWidget);

  // Tap on the Dropdown field to focus it
  await tester.tap(dropDownFinder);
  await tester
      .pumpAndSettle(); // Wait for the tap and any animations to complete

// Find the first dropdown menu item (index 0) and tap on it
  final firstDropdownItem = find.text("1");
  expect(firstDropdownItem, findsOneWidget);

  // Tap the first item
  await tester.tap(firstDropdownItem);
  await tester.pumpAndSettle(); // Wait for the selection to be made
}
