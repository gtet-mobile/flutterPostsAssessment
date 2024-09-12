// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posts/service_locator.dart';

import './step/the_app_is_running.dart';
import './step/i_see_header_title_key.dart';
import './step/i_see_icon.dart';
import './step/i_see_loader.dart';
import './step/i_should_see_listview.dart';
import './step/i_refresh_the_list_view.dart';
import './step/i_should_see_refreshed_listview.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Load Posts''', () {
    initServiceProvider();
    testWidgets('''Load all posts''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeHeaderTitleKey(tester);
      await iSeeIcon(tester, Icons.add);
      await iSeeLoader(tester);
      await iShouldSeeListview(tester);
      await iRefreshTheListView(tester);
      await iShouldSeeRefreshedListview(tester);
    });
  });
}
