import 'package:flutter/material.dart';
import 'package:otus_home_2/objects/recipe.dart';
import 'package:otus_home_2/features/recipe_card.dart';

class RecipeListPage extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeListPage({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: recipes.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
              height: 16.0);
        },
        itemBuilder: (context, index) {
          return RecipeCard(recipe: recipes[index]);
        },
      ),
    );
  }
}
