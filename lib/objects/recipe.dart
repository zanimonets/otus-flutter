class Recipe {
  final String title;
  final String imageAsset;
  final String cookingTime;

  Recipe({
    required this.title,
    required this.imageAsset,
    required this.cookingTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      imageAsset: json['imageAsset'],
      cookingTime: json['cookingTime'],
    );
  }
}
