import 'package:flutter/material.dart';
import '../../domain_layer/models/post_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      child: ListTile(
        trailing: Text('UserId - ${post.userId}'),
        leading: Text('${post.id}', style: textTheme.bodySmall),
        title: Text(post.title, style: const TextStyle(fontWeight: FontWeight.w600),),
        isThreeLine: false,
        subtitle: Text(post.body, maxLines: 2,),
        dense: true,
      ),
    );
  }
}