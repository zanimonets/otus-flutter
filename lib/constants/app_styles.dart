import 'package:flutter/material.dart';

class AppStyles {
  // Fonts
  static const String primaryFont = 'Roboto';

  // Colors
  static const Color primaryGreenColor = Color(0xFF2ECC71);
  static const Color darkGreenColor = Color(0xFF165932);
  static const Color primaryGreyColor = Color(0xFF797676);
  static const Color backgroundGreyColor = Color(0xFFECECEC);
  static const Color stepNumberGreyColor = Color(0xFFC2C2C2);
  static const Color primaryBlackColor = Color(0xFF000000);

  static const MainAppBarStyle mainAppBarStyle = MainAppBarStyle();
  static const IngredientsStyle ingredientsStyle = IngredientsStyle();
  static const RecipeStepsStyle recipeStepsStyle = RecipeStepsStyle();
  static const RecipeCardStyle recipeCardStyle = RecipeCardStyle();
}

class MainAppBarStyle {
  const MainAppBarStyle();

  TextStyle get headerLabel => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppStyles.darkGreenColor,
  );
}

class RecipeCardStyle {
  const RecipeCardStyle();

  TextStyle get label => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppStyles.primaryBlackColor,
      );

  TextStyle get totalCookingTime => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppStyles.primaryGreenColor,
      );
}

class IngredientsStyle {
  const IngredientsStyle();

  TextStyle get name => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppStyles.primaryBlackColor,
      );

  TextStyle get amount => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppStyles.primaryGreyColor,
      );
}

class RecipeStepsStyle {
  const RecipeStepsStyle();

  TextStyle get step => const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        color: AppStyles.stepNumberGreyColor,
      );

  TextStyle get description => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppStyles.primaryGreyColor,
      );

  TextStyle get time => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppStyles.primaryGreyColor,
      );
}
