import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I refresh the List View
Future<void> iRefreshTheListView(WidgetTester tester) async {
  // Simulate a pull-to-refresh action by dragging down
  // await tester.pumpAndSettle();
  await tester.drag(
    find.byType(ListView),
    const Offset(0, 300), // Drag down
  );
  await tester.pump(); // Start the refresh process
  await tester.pump(const Duration(seconds: 3)); // Wait for refresh to finish
  await tester.pumpAndSettle();

}
