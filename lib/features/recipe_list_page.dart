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
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return RecipeDetailPage(recipe: recipes[index]);
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    var tween = Tween(begin: begin, end: end);
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                ),
              );
            },
            child: RecipeCard(recipe: recipes[index]),
          );
        },
      ),
    );
  }
}
