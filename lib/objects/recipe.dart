class Recipe {
  final String title;
  final String imageAsset;
  final String cookingTime;
  final List ingredients;
  final List receiptSteps;

  Recipe({
    required this.title,
    required this.imageAsset,
    required this.cookingTime,
    required this.ingredients,
    required this.receiptSteps
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      imageAsset: json['imageAsset'],
      cookingTime: json['cookingTime'],
      ingredients: json['ingredients'],
      receiptSteps: json['receiptSteps']
    );
  }
}
