import 'package:flutter/material.dart';

class FoodImage extends StatelessWidget {
  final String imageUrl;

  const FoodImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      height: 120.0,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          );
        }
      },
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('Error loading image');
      },
    );
  }
}