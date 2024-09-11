import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posts/app.dart';
import 'package:posts/service_locator.dart';

void main() {
  initServiceProvider();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('''Checking Post feature''', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: MyApp())));
    expect(find.byKey(const Key("HeaderTitle")), findsOneWidget);
    expect(find.byKey(const Key("PostsPageBlocProvider")), findsOneWidget);
    await tester.pumpAndSettle();
    expect(
      find.byKey(const Key("PostsPageBlocBuilder")),
      findsOneWidget,
    );
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    final firstItem = find.byKey(const Key('list_item_0'));
    expect(firstItem, findsOneWidget);
    await tester.tap(firstItem);
    await tester.pumpAndSettle();
  });
}
