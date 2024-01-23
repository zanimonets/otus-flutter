import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:otus_home_2/features/recipe_details/comments.dart';
import 'package:otus_home_2/features/recipe_details/ingredients_list.dart';
import 'package:otus_home_2/features/recipe_details/recipe_steps_list.dart';
import 'package:rive/rive.dart';
import '../objects/meals.dart';
import '../styles/app_styles.dart';
import 'food_image.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  SMIBool? _isChecked;
  bool _isFavorite = false;
  bool _isBookmarked = false;
  int bookmarkCounter = 0;

  @override
  Widget build(BuildContext context) {
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
                      widget.recipe.strMeal!,
                      style: AppStyles.recipeCardStyle.label,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: _onTapLikeIcon,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      width: 60.0,
                      height: 60.0,
                      child: RiveAnimation.asset(
                        'assets/rive/heart.riv',
                        onInit: _onRiveLikeIconInit,
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
                        // widget.recipe.cookingTime,
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
                          child:
                              FoodImage(imageUrl: widget.recipe.strMealThumb!)
                         ),
                      if (bookmarkCounter > 0)
                        Positioned(
                          right: 0,
                          bottom: 10.0,
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 1.5708,
                                child: Transform.scale(
                                  scaleY: 2.0,
                                  child: Icon(
                                    Icons.bookmark,
                                    color: _isBookmarked
                                        ? AppStyles.primaryGreenColor
                                        : AppStyles.primaryGreyColor,
                                  ),
                                ),
                              ),
                              Text(
                                bookmarkCounter.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                children: [IngredientsList(recipe: widget.recipe)],
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
            RecipeStepsList(recipe: widget.recipe),
            const RecipeComments(),
          ],
        ),
      ),
    );
  }


  void _onTapLikeIcon() {
    _isChecked!.value = !_isChecked!.value;

    setState(() {
      _isBookmarked = _isChecked!.value;
      if (_isBookmarked) {
        bookmarkCounter++;
      } else {
        bookmarkCounter = 0;
      }
    });
  }

  void _onRiveLikeIconInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard,'State Machine 1',);
    artboard.addController(controller!);
    _isChecked = controller.findInput<bool>('Checked') as SMIBool;
    _isChecked!.value = false;
  }
}
