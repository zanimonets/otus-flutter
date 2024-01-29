import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../objects/meals.dart';
import '../utils/data_parser.dart';

final isLikedProvider = StateProvider.family<bool, String?>((ref, idMeal) => false);
final bookmarkCounterProvider = StateProvider.family<int, String?>((ref, idMeal) => 0);
final recipesProvider = FutureProvider<List<Recipe>>((ref) async {
  return DataParse.loadRecipes();
});