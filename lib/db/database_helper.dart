import 'dart:async';
import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  // Database table and column names
  static const String tableMotivationQuotes = 'motivation_quotes';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnText = 'text';
  static const String columnAuthor = 'author';
  static const String columnCategory = 'category';

  // Open database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'motivation_quotes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableMotivationQuotes (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnText TEXT NOT NULL,
        $columnAuthor TEXT NOT NULL,
        $columnCategory TEXT NOT NULL
      )
    ''');
  }

  // Insert a quote
  Future<int> insert(MotivationQuote quote) async {
    Database db = await instance.database;
    return await db.insert(tableMotivationQuotes, quote.toMap());
  }

  // Get all quotes
  Future<List<MotivationQuote>> getAllQuotes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableMotivationQuotes);
    return List.generate(maps.length, (i) {
      return MotivationQuote(
        id: maps[i][columnId],
        title: maps[i][columnTitle],
        text: maps[i][columnText],
        author: maps[i][columnAuthor],
        category: maps[i][columnCategory],
      );
    });
  }

  // Update a quote
  Future<int> update(MotivationQuote quote) async {
    Database db = await instance.database;
    return await db.update(
      tableMotivationQuotes,
      quote.toMap(),
      where: '$columnId = ?',
      whereArgs: [quote.id],
    );
  }

  // Delete a quote
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(
      tableMotivationQuotes,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}

