import 'dart:convert';
import 'package:arabic_learning_frontend/Models/lesson.dart';
import 'package:http/http.dart' as http;

class LessonService {
  static const String apiUrl = 'http://your-django-backend-url/api/lessons/';

  Future<List<Lesson>> fetchLessons() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((lesson) => Lesson.fromJson(lesson)).toList();
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}
