import 'package:blog_app/core/theme/pallete.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogPage());
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                color: AppPallete.borderColor,
                dashPattern: [10, 4],
                radius: Radius.circular(10),
                strokeCap: StrokeCap.round,
              ),

              child: Container(
                height: 150,
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 40),
                    SizedBox(height: 15),
                    Text('Select your image', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    ['Technology', 'Business', 'Programming', 'Entertainment']
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: Chip(
                              label: Text(e),
                              side: BorderSide(color: AppPallete.borderColor),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: 20),
            BlogEditor(controller: titleController, hintText: 'Blog Title'),
            SizedBox(height: 20),
            BlogEditor(controller: contentController, hintText: 'Blog Content'),
          ],
        ),
      ),
    );
  }
}
