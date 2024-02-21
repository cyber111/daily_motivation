import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:daily_motivation/providers/quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuotePage extends StatelessWidget {
  final MotivationQuote quote;
  const QuotePage({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(quote.title),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Quote text
                    Text(
                      '"${quote.text}"',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 30),
                    //Category and Author
                    Text(quote.category, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    const SizedBox(height: 30),
                    Text('Author : ${quote.author}', style: const TextStyle( fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
