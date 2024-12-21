class Lesson {
  final int id;
  final String title;
  final String content;
  final String userType;
  final String category;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.userType,
    required this.category,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      userType: json['user_type'],
      category: json['category'],
    );
  }
}
