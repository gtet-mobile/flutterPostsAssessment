// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posts/features/create_post/presentation_layer/pages/add_post.dart';
import 'package:posts/service_locator.dart';

import './step/the_app_is_running.dart';
import './step/i_see_icon.dart';
import './step/i_tap_icon.dart';
import './step/i_navigated_to_page.dart';
import './step/i_see_text.dart';
import './step/i_see_title_textfield.dart';
import './step/i_tap_title_textfield.dart';
import './step/i_see_subtitle_textfield.dart';
import './step/i_tap_subtitle_textfield.dart';
import './step/i_see_dropdown.dart';
import './step/i_tap_dropdown.dart';
import './step/i_see_button.dart';
import './step/i_tap_button.dart';
import './step/i_see_list_view_in_posts_list_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''PostsList''', () {
    initServiceProvider();
    testWidgets('''Checking Post Feature SuccessFlow''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeIcon(tester, Icons.add);
      await iTapIcon(tester, Icons.add);
      await iNavigatedToPage(tester, AddPost);
      await iSeeText(tester, "Add Post");
      await iSeeTitleTextfield(tester, "Add Title");
      await iTapTitleTextfield(tester, "Add Title", "Testing Title");
      await iSeeSubtitleTextfield(tester, "SubTitle");
      await iTapSubtitleTextfield(tester, "SubTitle", "Subtitle Testing");
      await iSeeDropdown(tester, "Select a UserId");
      await iTapDropdown(tester, "Select a UserId");
      await iSeeButton(tester, "Submit");
      await iTapButton(tester, "Submit");
      await iSeeListViewInPostsListPage(tester);
    });
  });
}
