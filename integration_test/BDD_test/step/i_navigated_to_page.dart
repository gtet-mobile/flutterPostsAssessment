import 'package:flutter_test/flutter_test.dart';

/// Usage: I navigated to {AddPost} page
Future<void> iNavigatedToPage(WidgetTester tester, Type pageType) async {
  await tester.pumpAndSettle(); // Ensure all animations are completed
  expect(find.byType(pageType), findsOneWidget);
}
