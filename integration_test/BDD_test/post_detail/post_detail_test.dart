// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posts/features/posts_lists/posts_list_sl.dart';
import 'package:posts/service_locator.dart';

import './step/the_app_is_running.dart';
import './step/i_should_see_listview.dart';
import './step/i_see_first_list_item.dart';
import './step/i_tap_on_first_list_item.dart';
import './step/i_see_alert_view.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Post Detail''', () {
    initServiceProvider();
    testWidgets('''Load Post Details''', (tester) async {
      await theAppIsRunning(tester);
      await iShouldSeeListview(tester);
      await iSeeFirstListItem(tester);
      await iTapOnFirstListItem(tester);
      await iSeeAlertView(tester);
    });
  });
}
