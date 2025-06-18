import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const BlogEditor({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:
          TextInputType.multiline, //enables multiline behavior on the keyboard.
      textInputAction:
          TextInputAction.newline, //allows "Enter" to insert a new line.
      decoration: InputDecoration(hintText: hintText),
      maxLines: null, //allows the input to grow as needed vertically.
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is missing!';
        }
        return null;
      },
    );
  }
}
