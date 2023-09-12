import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otus_home_2/objects/recipe.dart';

class DataParse {
  static Future<List<Recipe>> loadRecipes(BuildContext context) async {
    final String jsonString =
    await DefaultAssetBundle.of(context).loadString('assets/data/receipts.json');

    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> jsonList = jsonData['receipts'];
    final List<Recipe> recipes =
    jsonList.map((json) => Recipe.fromJson(json)).toList();
    return recipes;
  }
}

