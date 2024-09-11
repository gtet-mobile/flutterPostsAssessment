import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/app.dart';
import 'package:posts/service_locator.dart';

void main() {
  initServiceProvider();
  group("Widget Tests for TDD in Posts List Screen", () {
    testWidgets("Add icon is present", (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: MyApp())));
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
