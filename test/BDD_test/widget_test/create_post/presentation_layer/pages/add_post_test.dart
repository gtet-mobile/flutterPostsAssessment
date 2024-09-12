// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/features/create_post/presentation_layer/pages/add_post.dart';
import 'package:posts/service_locator.dart';

import './step/the_app_is_running.dart';
import './step/i_tap_icon.dart';
import './step/i_navigated_to_page.dart';
import './step/i_see_text.dart';
import './step/i_see_textfield.dart';
import './step/i_see_button.dart';

void main() {
  initServiceProvider();
  group('''Add Post''', () {
    testWidgets('''When i tap add post button''', (tester) async {
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.add);
      await iNavigatedToPage(tester, AddPost);
      await iSeeText(tester, "Add Post");
      await iSeeTextfield(tester, "Add Title");
      await iSeeButton(tester, "Submit");
    });
  });
}
