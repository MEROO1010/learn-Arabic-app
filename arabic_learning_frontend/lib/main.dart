import 'package:arabic_learning_frontend/Models/lesson.dart';
import 'package:arabic_learning_frontend/Services/lesson_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Arabic Learning App', home: LessonListScreen());
  }
}

class LessonListScreen extends StatefulWidget {
  @override
  _LessonListScreenState createState() => _LessonListScreenState();
}

class _LessonListScreenState extends State<LessonListScreen> {
  late Future<List<Lesson>> futureLessons;

  @override
  void initState() {
    super.initState();
    futureLessons = LessonService().fetchLessons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lessons')),
      body: FutureBuilder<List<Lesson>>(
        future: futureLessons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Lesson> lessons = snapshot.data!;
            return ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(lessons[index].title),
                  subtitle: Text(lessons[index].content),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
