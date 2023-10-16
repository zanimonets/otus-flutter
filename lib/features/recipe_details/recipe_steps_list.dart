import 'package:flutter/material.dart';

import '../../objects/recipe.dart';
import '../../styles/app_styles.dart';

class RecipeStepsList extends StatefulWidget {
  final Recipe recipe;

  RecipeStepsList({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeStepsListState createState() => _RecipeStepsListState();
}

class _RecipeStepsListState extends State<RecipeStepsList> {
  List<bool> stepCheckedList = [];

  @override
  void initState() {
    super.initState();
    stepCheckedList = List.generate(widget.recipe.receiptSteps.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.recipe.receiptSteps.length,
      itemBuilder: (context, index) {
        final item = widget.recipe.receiptSteps[index];
        final step = item["step"];
        final description = item["description"];
        final time = item["time"];
        final isChecked = stepCheckedList[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              stepCheckedList[index] = !isChecked;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppStyles.backgroundGreyColor,
              border: Border.all(
                color: AppStyles.backgroundGreyColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(step, style: AppStyles.recipeStepsStyle.step),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(description, style: AppStyles.recipeStepsStyle.description),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            stepCheckedList[index] = value ?? false;
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.white,
                      ),
                    ),
                    Text(time, style: AppStyles.recipeStepsStyle.time),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}