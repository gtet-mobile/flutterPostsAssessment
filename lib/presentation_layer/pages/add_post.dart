import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/presentation_layer/create_post_bloc/create_post_bloc.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  int? _selectedNumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          // Pop the screen and navigate back to the previous screen
          Navigator.of(context).pop();
        } else if (state is AddPostFailure) {
          // Handle failure state (show a message, etc.)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to post: ${state.error}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Post'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController1,
                decoration: const InputDecoration(
                  labelText: 'Add Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _textController2,
                decoration: const InputDecoration(
                  labelText: 'SubTitle',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<int>(
                key: const Key("Select a UserId"),
                value: _selectedNumber,
                decoration: const InputDecoration(
                  labelText: 'Select a UserId',
                  border: OutlineInputBorder(),
                ),
                items: List.generate(10, (index) {
                  return DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    _selectedNumber = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Trigger the SubmitPost event
                  context.read<CreatePostBloc>().add(
                    SubmitPost(
                      title: _textController1.text,
                      subtitle: _textController2.text,
                      userId: _selectedNumber ?? 1,
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
