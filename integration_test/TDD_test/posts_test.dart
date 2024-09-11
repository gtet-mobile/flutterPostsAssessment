import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posts/app.dart';
import 'package:posts/features/create_post/presentation_layer/pages/add_post.dart';
import 'package:posts/service_locator.dart';

void main() {
  initServiceProvider();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('''Checking Post feature''', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: MyApp())));
    /// Find Icon
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.pumpAndSettle();
    /// Tap Icon
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); // Ensure all animations are completed
    /// Navigated Screen
    expect(find.byType(AddPost), findsOneWidget);
    expect(find.text("Add Post"), findsOneWidget);
    /// Add Title TextField Found
    final textFieldFinder = find.widgetWithText(TextField, "Add Title");
    expect(textFieldFinder, findsOneWidget,
        reason:
            'Expected to find a TextField with the text Add Title but found none.');
    // Tap on the text field to focus it
    await tester.tap(textFieldFinder);
    await tester
        .pumpAndSettle(); // Wait for the tap and any animations to complete
    await tester.enterText(textFieldFinder, "Testing TDD Integration Test");
    await tester.pumpAndSettle(); // Wait for the text to be entered
    /// Subtitle TextField Found
    final textFieldSubTitleFinder = find.widgetWithText(TextField, "SubTitle");
    expect(textFieldSubTitleFinder, findsOneWidget,
        reason:
            'Expected to find a TextField with the text SubTitle but found none.');
    // Tap on the text field to focus it
    await tester.tap(textFieldSubTitleFinder);
    await tester
        .pumpAndSettle(); // Wait for the tap and any animations to complete
    await tester.enterText(textFieldSubTitleFinder, "Testing TDD Integration Test");
    await tester.pumpAndSettle(); // Wait for the text to be entered
    /// Drop Down
    final dropDownFinder = find.byKey(const Key("Select a UserId"));
    expect(dropDownFinder, findsOneWidget,
        reason:
            'Expected to find a DropDown with the text Select a UserId but found none.');
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
    ///Submit Button
    expect(find.widgetWithText(ElevatedButton, "Submit"),
        findsOneWidget);
    await tester.tap(find.text("Submit"));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
