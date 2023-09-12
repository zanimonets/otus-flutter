import 'package:flutter/material.dart';
import 'package:otus_home_2/styles/app_styles.dart';
import 'utils/data_parser.dart';
import 'features/recipe_list_page.dart';
import 'objects/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: AppStyles.primaryFont),
      home: FutureBuilder(
        future: DataParse.loadRecipes(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('Data loading error');
          } else {
            final List<Recipe> recipes = snapshot.data as List<Recipe>;
            return RecipeListPage(recipes: recipes);
          }
        },
      ),
    );
  }
}



