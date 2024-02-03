import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otus_home_2/objects/meals.dart';
import 'package:otus_home_2/state/providers.dart';
import 'package:otus_home_2/constants/app_styles.dart';
import 'features/recipe_list_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsyncValue = ref.watch(recipesProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppStyles.primaryFont,
        colorScheme: const ColorScheme.light().copyWith(primary: AppStyles.primaryGreyColor),
      ),
      home: recipesAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          debugPrint('!!!DEBUG $error');
          return const Text('Data loading error');
        },
        data: (List<Recipe> recipes) {
          return RecipeListPage(recipes: recipes);
        },
      ),
    );
  }
}
