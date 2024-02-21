import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:flutter/material.dart';

class QuoteTile extends StatelessWidget {
  final MotivationQuote quote;
  final void Function() onTap;

  const QuoteTile({
    super.key,
    required this.quote,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            quote.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
