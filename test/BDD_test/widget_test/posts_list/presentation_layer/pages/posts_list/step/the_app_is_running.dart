import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts/features/posts_lists/domain_layer/models/post_model.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpAndSettle(const Duration(seconds: 2));
  final post = PostModel(userId: 1, id: 0, title: "Testing title", body: "Testing Body");
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Lists of posts", key: Key("HeaderTitle"),),),
        body: ListView.builder(
          key: const Key("PostsPageList"),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              key: Key('list_item_$index'), // Assign a key to each item
              title: Text(post.title),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {  },
            child: const Icon(Icons.add)),
      ),
    ),
  );

}
