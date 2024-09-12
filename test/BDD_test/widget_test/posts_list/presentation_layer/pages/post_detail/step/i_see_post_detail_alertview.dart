import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see post detail AlertView
Future<void> iSeePostDetailAlertview(WidgetTester tester) async {
  expect(find.byKey(const Key('PostDetailAlertView')), findsOneWidget);
}
