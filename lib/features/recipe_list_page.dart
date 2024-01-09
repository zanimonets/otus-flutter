import 'package:flutter/material.dart';
import 'package:otus_home_2/features/recipe_detail_page.dart';
import 'package:otus_home_2/features/recipe_card.dart';
import '../objects/meals.dart';

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
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipe: recipes[index]),
                ),
              );
            },
            child: RecipeCard(recipe: recipes[index]),
          );
          return RecipeCard(recipe: recipes[index]);
        },
      ),
    );
  }
}
