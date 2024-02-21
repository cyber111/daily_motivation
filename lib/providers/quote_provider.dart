import 'package:daily_motivation/models/data.dart';
import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:flutter/material.dart';

class QuoteProvider extends ChangeNotifier {
  List<MotivationQuote> quotes = motivationQuotes;

  void addQuote(MotivationQuote quote) {
    quotes.add(quote);
    notifyListeners();
  }
}
