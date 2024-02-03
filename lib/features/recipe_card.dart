import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otus_home_2/constants/app_styles.dart';
import 'package:otus_home_2/constants/label_constants.dart';
import 'package:otus_home_2/features/common_components/bookmark_indicator.dart';
import 'package:otus_home_2/features/food_image.dart';
import 'package:otus_home_2/objects/meals.dart';
import 'package:otus_home_2/state/providers.dart';

class RecipeCard extends ConsumerWidget {
  final Recipe recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkCounter = ref.watch(bookmarkCounterProvider(recipe.idMeal));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: FoodImage(imageUrl: recipe.strMealThumb!),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      recipe.strMeal ?? LabelConstants.notDefined,
                      style: AppStyles.recipeCardStyle.label,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.access_time_rounded,
                          color: AppStyles.primaryBlackColor,
                        ),
                      ),
                      Text(
                        LabelConstants.notDefined,
                        style: AppStyles.recipeCardStyle.totalCookingTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         // Spacer(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: BookmarkIndicator(recipeId: recipe.idMeal!),
            ),
          )
        ],
      ),
    );
  }
}
