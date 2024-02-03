import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otus_home_2/objects/meals.dart';
import 'package:otus_home_2/utils/data_parser.dart';

final isLikedProvider = StateProvider.family<bool, String?>((ref, idMeal) => false);
final bookmarkCounterProvider = StateProvider.family<int, String?>((ref, idMeal) => 0);
final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
  return DataParse.loadRecipes();
});