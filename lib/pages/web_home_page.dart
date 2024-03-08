import 'package:daily_motivation/components/quote_tile.dart';
import 'package:daily_motivation/pages/add_quote_page.dart';
import 'package:daily_motivation/pages/quote_page.dart';
import 'package:daily_motivation/providers/motivation_quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MotivationQuoteProvider>(
      builder: (context, provider, child) {
        final quotes = provider.quotes ?? [];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Q U O T E S',
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return QuoteTile(
                quote: quotes[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuotePage(quote: quotes[index]),
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddQuotePage(),
                )),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
/*
*    final quotes = snapshot.data!;
                return quotes.isEmpty
                    ? const GetStarted()
                    : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    return QuoteTile(
                      quote: quotes[index],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuotePage(quote: quotes[index]),
                        ),
                      ),
                    );
                  },
                );*/
