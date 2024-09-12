import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/app.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: Scaffold(body: MyApp())));
  await tester.pumpAndSettle(const Duration(seconds: 2));

}
