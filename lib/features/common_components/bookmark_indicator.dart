import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/providers.dart';
import '../../styles/app_styles.dart';

class BookmarkIndicator extends ConsumerWidget {
  final String recipeId;

  const BookmarkIndicator({Key? key, required this.recipeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkCounter = ref.watch(bookmarkCounterProvider(recipeId));

      if (bookmarkCounter > 0) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
              angle: 1.5708,
              child: Transform.scale(
                scaleY: 2.0,
                child: const Icon(
                  Icons.bookmark,
                  color: AppStyles.primaryGreenColor,
                ),
              ),
            ),
            Text(
              bookmarkCounter.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }
}
