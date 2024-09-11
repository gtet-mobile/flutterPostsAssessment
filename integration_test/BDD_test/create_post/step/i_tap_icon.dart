import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Example: When I tap {Icons.add} icon
Future<void> iTapIcon(
  WidgetTester tester,
  IconData icon,
) async {
  await tester.pumpAndSettle(); // Ensure api data is loaded
  await tester.tap(find.byIcon(icon));
  await tester.pump();
}
