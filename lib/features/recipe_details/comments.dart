import 'package:flutter/material.dart';
import '../../styles/app_styles.dart';

class RecipeComment {
  final String author;
  final String text;

  RecipeComment(this.author, this.text);
}

List<RecipeComment> _comments = [];

void addComment(String author, String text) {
  _comments.add(RecipeComment(author, text));
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

  void _handleCommentSubmit() {
    final author = _authorController.text;
    final text = _textController.text;
    if (author.isNotEmpty && text.isNotEmpty) {
      addComment(author, text);
      _authorController.clear();
      _textController.clear();
      setState(() {});
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
              scrollDirection: Axis.vertical,
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  title: Text(comment.author),
                  subtitle: Text(comment.text),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteComment(index);
                      setState(() {});
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
                    labelText: 'Имя',
                  ),
                ),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Оставить комментарий',
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
