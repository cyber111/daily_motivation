import 'package:daily_motivation/components/quote_tile.dart';
import 'package:daily_motivation/pages/quote_page.dart';
import 'package:daily_motivation/providers/quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Q U O T E S',
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: provider.quotes.length,
            itemBuilder: (context, index) {
              return QuoteTile(
                quote: provider.quotes[index],
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuotePage(quote: provider.quotes[index]),
                    ),),
              );
            },
          ),
        );
      },
    );
  }
}
