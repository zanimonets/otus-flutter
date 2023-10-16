import 'package:flutter/material.dart';
import 'package:otus_home_2/styles/app_styles.dart';
import 'utils/data_parser.dart';
import 'features/recipe_list_page.dart';
import 'objects/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Recipe>>? _recipeFuture;

  @override
  void initState() {
    super.initState();
    _recipeFuture = DataParse.loadRecipes(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppStyles.primaryFont,colorScheme: ColorScheme.light().copyWith(primary: AppStyles.primaryGreyColor )),
      home: FutureBuilder(
        future: _recipeFuture,
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
