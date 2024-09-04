import 'dart:io';
import 'package:flutter/material.dart';

class PhotoViewScreen extends StatelessWidget {
  final String imagePath;

  PhotoViewScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Просмотр фотографии'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Image.file(File(imagePath)),
        ),
      ),
    );
  }
}
