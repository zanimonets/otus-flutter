import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otus_home_2/objects/meals.dart';
import 'package:otus_home_2/styles/app_styles.dart';
import 'utils/data_parser.dart';
import 'features/recipe_list_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Recipe>> _recipeFuture;

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
            return const Center(child: SizedBox(width: 25, height: 25, child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            debugPrint('!!!DEBUG $snapshot.error');
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
