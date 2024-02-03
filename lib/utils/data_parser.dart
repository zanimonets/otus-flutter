import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:otus_home_2/objects/meals.dart';
import 'package:otus_home_2/services/api/meal_api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataParse {
  static Future<List<Recipe>> loadRecipes(BuildContext context) async {
    await Hive.initFlutter();
    Hive.registerAdapter(RecipeAdapter());
    final mealsBox = await Hive.openBox('meals_box');

    final MealAPIService mealService = MealAPIService();
    Map<String, dynamic> allMealsJsonData = {};

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        allMealsJsonData = await mealService.fetchAllMeals();
        mealsBox.put('data', allMealsJsonData);

      } catch (e) {
        debugPrint('!!! DEBUG DataParse: $e');
      }
    } else {
      if (mealsBox.containsKey('data')) {
        final dynamic linkedMapData = mealsBox.get('data');
        if (linkedMapData is Map<dynamic, dynamic>) {
          allMealsJsonData = Map<String, dynamic>.from(linkedMapData);
        }
      }
    }

    final Meals meals = Meals();
    List<Recipe> mealsList = meals.getListRecipes(jsonMeals: allMealsJsonData);
    return mealsList;
  }
}