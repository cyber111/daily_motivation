import 'package:daily_motivation/models/data.dart';
import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MotivationQuoteProvider extends ChangeNotifier {
  late Database _database;

  MotivationQuoteProvider() {
    _initDatabase();
  }

  get quotes => motivationQuotes;

  Future<void> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'motivation_quotes.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    notifyListeners();
  }

  void add() async {
    for (var quote in motivationQuotes) {
      await insert(quote);
    }
    notifyListeners();
  }

  void getQuotes(){

  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE motivation_quotes (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        text TEXT NOT NULL,
        author TEXT NOT NULL,
        category TEXT NOT NULL
      )
    ''');
  }

  Future<int> insert(MotivationQuote quote) async {
    final id = await _database.insert('motivation_quotes', quote.toMap());
    notifyListeners();
    return id;
  }

  Future<List<MotivationQuote>> getAllQuotes() async {
    final List<Map<String, dynamic>> maps = await _database.query('motivation_quotes');
    return List.generate(maps.length, (i) {
      return MotivationQuote(
        id: maps[i]['id'],
        title: maps[i]['title'],
        text: maps[i]['text'],
        author: maps[i]['author'],
        category: maps[i]['category'],
      );
    });
  }

  Future<int> delete(int id) async {
    final rowsAffected = await _database.delete(
      'motivation_quotes',
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
    return rowsAffected;
  }
}