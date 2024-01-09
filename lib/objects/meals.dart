import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Recipe {
  @HiveField(0)
  String? idMeal;

  @HiveField(1)
  String? strMeal;

  @HiveField(2)
  String? strDrinkAlternate;

  @HiveField(3)
  String? strCategory;

  @HiveField(4)
  String? strArea;

  @HiveField(5)
  String? strInstructions;

  @HiveField(6)
  String? strMealThumb;

  @HiveField(7)
  String? strTags;

  @HiveField(8)
  String? strYoutube;

  @HiveField(9)
  String? strIngredient1;

  @HiveField(10)
  String? strIngredient2;

  @HiveField(11)
  String? strIngredient3;

  @HiveField(12)
  String? strIngredient4;

  @HiveField(13)
  String? strIngredient5;

  @HiveField(14)
  String? strIngredient6;

  @HiveField(15)
  String? strIngredient7;

  @HiveField(16)
  String? strIngredient8;

  @HiveField(17)
  String? strIngredient9;

  @HiveField(18)
  String? strIngredient10;

  @HiveField(19)
  String? strIngredient11;

  @HiveField(20)
  String? strIngredient12;

  @HiveField(21)
  String? strIngredient13;

  @HiveField(22)
  String? strIngredient14;

  @HiveField(23)
  String? strIngredient15;

  @HiveField(24)
  String? strIngredient16;

  @HiveField(25)
  String? strIngredient17;

  @HiveField(26)
  String? strIngredient18;

  @HiveField(27)
  String? strIngredient19;

  @HiveField(28)
  String? strIngredient20;

  @HiveField(29)
  String? strMeasure1;

  @HiveField(30)
  String? strMeasure2;

  @HiveField(31)
  String? strMeasure3;

  @HiveField(32)
  String? strMeasure4;

  @HiveField(33)
  String? strMeasure5;

  @HiveField(34)
  String? strMeasure6;

  @HiveField(35)
  String? strMeasure7;

  @HiveField(36)
  String? strMeasure8;

  @HiveField(37)
  String? strMeasure9;

  @HiveField(38)
  String? strMeasure10;

  @HiveField(39)
  String? strMeasure11;

  @HiveField(40)
  String? strMeasure12;

  @HiveField(41)
  String? strMeasure13;

  @HiveField(42)
  String? strMeasure14;

  @HiveField(43)
  String? strMeasure15;

  @HiveField(44)
  String? strMeasure16;

  @HiveField(45)
  String? strMeasure17;

  @HiveField(46)
  String? strMeasure18;

  @HiveField(47)
  String? strMeasure19;

  @HiveField(48)
  String? strMeasure20;

  @HiveField(49)
  String? strSource;

  @HiveField(50)
  String? strImageSource;

  @HiveField(51)
  String? strCreativeCommonsConfirmed;

  @HiveField(52)
  String? dateModified;

  Recipe({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });


  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  List<Map<String, String>> getIngredients() {
    final List<Map<String, String>> ingredientsList = [];
    final List<String?> ingredients = [
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7,
      strIngredient8,
      strIngredient9,
      strIngredient10,
      strIngredient11,
      strIngredient12,
      strIngredient13,
      strIngredient14,
      strIngredient15,
      strIngredient16,
      strIngredient17,
      strIngredient18,
      strIngredient19,
      strIngredient20,
    ];
    final List<String?> measures = [
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5,
      strMeasure6,
      strMeasure7,
      strMeasure8,
      strMeasure9,
      strMeasure10,
      strMeasure11,
      strMeasure12,
      strMeasure13,
      strMeasure14,
      strMeasure15,
      strMeasure16,
      strMeasure17,
      strMeasure18,
      strMeasure19,
      strMeasure20,
    ];

    for (int i = 0; i < ingredients.length; i++) {
      final String? ingredient = ingredients[i];
      final String? measure = measures[i];

      if (ingredient != null && measure != null && ingredient.isNotEmpty && measure.isNotEmpty) {
        ingredientsList.add({
          'name': ingredient,
          'amount': measure,
        });
      }
    }
    return ingredientsList;
  }

  List getDescriptionsBySteps() {
    final List<String> descriptionsBySteps = strInstructions!.split('\r\n');
    return descriptionsBySteps;
  }
}

class Meals {
  List<Recipe> getListRecipes({required Map<String, dynamic> jsonMeals}) {
    List<dynamic> mealsList = jsonMeals['meals'];
    List<Recipe> listRecipes = mealsList.map((meal) => Recipe.fromJson(meal)).toList();
    return listRecipes;
  }
}
