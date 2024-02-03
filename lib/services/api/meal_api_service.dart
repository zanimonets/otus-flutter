import 'package:dio/dio.dart';

class MealAPIService {
  final Dio dio = Dio(); // Create a Dio instance

  Future<Map<String, dynamic>> fetchAllMeals() async {
    try {
      final response = await dio.get('https://www.themealdb.com/api/json/v1/1/search.php?s');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('11Failed to load meals');
      }
    } catch (e) {
      throw Exception('222Failed to load meals: $e');
    }
  }
}