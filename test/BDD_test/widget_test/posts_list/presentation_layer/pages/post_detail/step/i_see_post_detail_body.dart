import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see post detail Body
Future<void> iSeePostDetailBody(WidgetTester tester) async {
  expect(find.byKey(const Key('PostDetailBody')), findsOneWidget);
}
