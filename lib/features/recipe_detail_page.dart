import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:otus_home_2/features/recipe_details/comments.dart';
import 'package:otus_home_2/features/recipe_details/ingredients_list.dart';
import 'package:otus_home_2/features/recipe_details/recipe_steps_list.dart';
import 'package:rive/rive.dart';
import '../objects/meals.dart';
import '../state/providers.dart';
import '../styles/app_styles.dart';
import 'common_components/bookmark_indicator.dart';
import 'food_image.dart';

class RecipeDetailPage extends ConsumerWidget {
  final Recipe recipe;
  StateMachineController? _riveController;

  RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(isLikedProvider(recipe.idMeal));
    final bookmarkCounter = ref.watch(bookmarkCounterProvider(recipe.idMeal));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Рецепт",
            style: AppStyles.mainAppBarStyle.headerLabel,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.bullhorn),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe.strMeal!,
                      style: AppStyles.recipeCardStyle.label,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () => _onTapLikeIcon(context, ref),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      width: 60.0,
                      height: 60.0,
                      child: RiveAnimation.asset(
                        'assets/rive/heart.riv',
                        onInit: (artboard) =>
                            _onRiveLikeIconInit(artboard, ref, recipe.idMeal!),
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.access_time_rounded,
                          color: AppStyles.primaryBlackColor,
                        ),
                      ),
                      Text(
                        "Not defined",
                        style: AppStyles.recipeCardStyle.totalCookingTime,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 320.0,
                          color: Colors.white,
                          child: FoodImage(imageUrl: recipe.strMealThumb!)),
                      Positioned(
                          right: 0,
                          bottom: 10.0,
                          child: BookmarkIndicator(recipeId: recipe.idMeal!))
                    ],
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(
                'Ингредиенты',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppStyles.primaryGreenColor,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [IngredientsList(recipe: recipe)],
              ),
            ),
            const ListTile(
              title: Text(
                'Шаги приготовления',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RecipeStepsList(recipe: recipe),
            const RecipeComments(),
          ],
        ),
      ),
    );
  }

  void _onTapLikeIcon(BuildContext context, WidgetRef ref) {
    final currentState =
        ref.read(isLikedProvider(recipe.idMeal).notifier).state;
    ref.read(isLikedProvider(recipe.idMeal).notifier).state = !currentState;

    if (!currentState) {
      ref.read(bookmarkCounterProvider(recipe.idMeal).notifier).state++;
    } else {
      ref.read(bookmarkCounterProvider(recipe.idMeal).notifier).state--;
    }

    final isCheckedInput = _riveController?.findInput<bool>('Checked');
    if (isCheckedInput is SMIBool) {
      isCheckedInput.value = !currentState;
    }
  }

  void _onRiveLikeIconInit(Artboard artboard, WidgetRef ref, String idMeal) {
    _riveController =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (_riveController != null) {
      artboard.addController(_riveController!);
      final isCheckedInput = _riveController!.findInput<bool>('Checked');
      if (isCheckedInput is SMIBool) {
        final isLiked = ref.read(isLikedProvider(idMeal).notifier).state;
        isCheckedInput.value = isLiked;
      }
    }
  }
}
