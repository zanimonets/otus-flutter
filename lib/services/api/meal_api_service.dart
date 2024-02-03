import 'package:dio/dio.dart';

class MealAPIService {
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s';

  final Dio dio = Dio();

  Future<Map<String, dynamic>> fetchAllMeals() async {
    try {
      final response = await dio.get(_baseUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load meals: Wrong status code');
      }
    } catch (e) {
      throw Exception('Failed to load meals: Unhandled exception: $e');
    }
  }
}