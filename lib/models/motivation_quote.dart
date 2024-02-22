import 'package:daily_motivation/db/database_helper.dart';

class MotivationQuote {
  final int? id;
  final String title;
  final String text;
  final String author;
  final String category;

  MotivationQuote({
    this.id,
    required this.title,
    required this.text,
    required this.author,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnText: text,
      DatabaseHelper.columnAuthor: author,
      DatabaseHelper.columnCategory: category,
    };
  }
}