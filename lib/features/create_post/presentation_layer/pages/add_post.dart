import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../create_post_bloc/create_post_bloc.dart';

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
  void initState() {
    super.initState();
    _textController1.addListener(_onFormChange);
    _textController2.addListener(_onFormChange);
  }

  void _onFormChange() {
    context.read<CreatePostBloc>().add(
          ValidatePost(
            title: _textController1.text,
            subtitle: _textController2.text,
            userId: _selectedNumber ?? 0,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Successfully Posted')),
          );
          // Navigate back and pass the new post to the posts list page
          Navigator.of(context).pop(state);
        }
      },
      builder: (context, state) {
        final isSubmitEnabled =
            state is IsSubmitBtnEnabled && state.isEnabled;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Post'),
          ),
          body: SingleChildScrollView(
            child: Padding(
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
                      _onFormChange();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: isSubmitEnabled
                        ? () {
                            context.read<CreatePostBloc>().add(
                                  SubmitPost(
                                    title: _textController1.text,
                                    subtitle: _textController2.text,
                                    userId: _selectedNumber ?? 1,
                                  ),
                                );
                          }
                        : showSnackBar, // Disable the button if the form is invalid
                    child: const Text('Submit'),
                  ),
                  if (state is AddPostSubmitting)
                    // Show CircularProgressIndicator while submitting
                    const CircularProgressIndicator()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill all fields')),
    );
  }
}
