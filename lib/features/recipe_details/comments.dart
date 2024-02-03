import 'dart:io';
import 'package:flutter/material.dart';
import 'package:otus_home_2/features/recipe_details/photo_view_screen.dart';
import '../../styles/app_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class RecipeComment {
  final String author;
  final String text;
  final String? imagePath;

  RecipeComment(this.author, this.text, {this.imagePath});
}

List<RecipeComment> _comments = [];

void addComment(String author, String text, {String? imagePath}) {
  _comments.add(RecipeComment(author, text, imagePath: imagePath));
}

void deleteComment(int index) {
  _comments.removeAt(index);
}

class RecipeComments extends StatefulWidget {
  const RecipeComments({super.key});

  @override
  RecipeCommentsState createState() => RecipeCommentsState();
}

class RecipeCommentsState extends State<RecipeComments> {
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  String? _imagePath;

  void _handleCommentSubmit() {
    final author = _authorController.text;
    final text = _textController.text;
    if (author.isNotEmpty && text.isNotEmpty) {
      addComment(author, text, imagePath: _imagePath);
      _authorController.clear();
      _textController.clear();
      _imagePath = null;
      setState(() {});
    }
  }

  Future<void> _takePhoto() async {
    final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final appDocDir = await getApplicationDocumentsDirectory();
      final dirPath = '${appDocDir.path}/photos';
      await Directory(dirPath).create(recursive: true);

      final newPath = '$dirPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
      File(pickedImage.path).copySync(newPath);

      setState(() {
        _imagePath = newPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  title: Text(comment.author),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(comment.text),
                      if (comment.imagePath != null)
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PhotoViewScreen(imagePath: comment.imagePath!),
                            )),
                            child: Image.file(
                              File(comment.imagePath!),
                              width: 100,
                              height: 110,
                            ),
                          ),
                        ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        deleteComment(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Form for adding a new comment
          Padding(
            padding: const EdgeInsets.only(left:16.0, right: 16.0),
            child: Column(
              children: [
                TextField(
                  controller: _authorController,
                  decoration: const InputDecoration(
                    labelText: '* Имя',
                  ),
                ),
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: '* Оставить комментарий',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _takePhoto();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/makePhotoIcon.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.primaryGreenColor,
                  ),
                  onPressed: _handleCommentSubmit,
                  child: Text('Отправить'),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
