// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/service_locator.dart';

import './step/the_app_is_running.dart';
import './step/i_see_header_title.dart';
import './step/i_see_listview.dart';
import './step/i_see_icon.dart';

void main() {
  group('''PostsList''', () {
    initServiceProvider();
    testWidgets('''Have add post button''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeHeaderTitle(tester);
      await iSeeListview(tester);
      await iSeeIcon(tester, Icons.add);
    });
  });
}
