import 'package:flutter/material.dart';
import '../../objects/recipe.dart';
import '../../styles/app_styles.dart';

class IngredientsList extends StatelessWidget {
  final Recipe recipe;

  const IngredientsList({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> ingredientWidgets = [];

    for (final ingredient in recipe.ingredients) {
      ingredientWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\u2022 ${ingredient['name']}',
                  style: AppStyles.ingredientsStyle.name),
              Text(ingredient['amount'],
                  style: AppStyles.ingredientsStyle.amount),
            ],
          ),
        ),
      );
    }

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: ingredientWidgets,
    );
  }
}
