import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I see post detail Id
Future<void> iSeePostDetailId(WidgetTester tester) async {
  expect(find.byKey(const Key('PostDetailId')), findsOneWidget);
}
