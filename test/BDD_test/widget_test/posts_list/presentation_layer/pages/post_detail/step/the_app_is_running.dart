import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/app.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpAndSettle(const Duration(seconds: 2));
  final post = PostModel(userId: 1, id: 0, title: "Testing title", body: "Testing Body");
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          key: const Key("PostsPageList"),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                  return AlertDialog(
                    key: const Key("PostDetailAlertView"),
                    title: Text('User ID: ${post.userId}', key: const Key("PostDetailId"),),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          key: const Key("PostDetailTitle"),
                          style:
                          const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        Text('Subtitle: ${post.body}', key: const Key("PostDetailBody"),),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
                );
              },
              child: ListTile(
                key: Key('list_item_$index'), // Assign a key to each item
                title: Text(post.title),
              ),
            );
          },
        ),
      ),
    ),
  );

}
