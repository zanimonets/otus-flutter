import 'package:flutter/material.dart';
import 'package:otus_home_2/objects/recipe.dart';
import 'package:otus_home_2/styles/app_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              recipe.imageAsset,
              fit: BoxFit.cover,
              height: 120.0,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      recipe.title,
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
                        recipe.cookingTime,
                        style: AppStyles.recipeCardStyle.totalCookingTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
