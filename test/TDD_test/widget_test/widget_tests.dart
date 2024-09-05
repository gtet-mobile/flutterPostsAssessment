import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/app.dart';

void main() {
  group("Widget Tests for TDD in Posts List Screen", () {
    testWidgets("Add icon is present", (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });

  group("Widget Tests for TDD in Add Posts Screen", () {
    testWidgets("Tapped on Add post icon in post list screen", (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text("Add Post"), findsOneWidget);
      expect(find.widgetWithText(TextField, "Add Title"), findsOneWidget);
      expect(find.widgetWithText(TextField, "SubTitle"), findsOneWidget);
      expect(find.byKey(const Key("Select a UserId")), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

  });
}