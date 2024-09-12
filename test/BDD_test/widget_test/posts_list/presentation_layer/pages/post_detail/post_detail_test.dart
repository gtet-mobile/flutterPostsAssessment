// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/service_locator.dart';

import './step/the_app_is_running.dart';
import './step/i_see_listview.dart';
import './step/i_see_first_list_item.dart';
import './step/i_tap_on_first_list_item.dart';
import './step/i_see_post_detail_alertview.dart';
import './step/i_see_post_detail_id.dart';
import './step/i_see_post_detail_title.dart';
import './step/i_see_post_detail_body.dart';

void main() {
  group('''Post Detail''', () {
    initServiceProvider();
    testWidgets('''Post Detail Alert''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeListview(tester);
      await iSeeFirstListItem(tester);
      await iTapOnFirstListItem(tester);
      await iSeePostDetailAlertview(tester);
      await iSeePostDetailId(tester);
      await iSeePostDetailTitle(tester);
      await iSeePostDetailBody(tester);
    });
  });
}
