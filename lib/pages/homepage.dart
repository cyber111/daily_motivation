import 'package:daily_motivation/components/quote_tile.dart';
import 'package:daily_motivation/db/database_helper.dart';
import 'package:daily_motivation/models/data.dart';
import 'package:daily_motivation/models/motivation_quote.dart';
import 'package:daily_motivation/pages/add_quote_page.dart';
import 'package:daily_motivation/pages/get_started.dart';
import 'package:daily_motivation/pages/quote_page.dart';
import 'package:daily_motivation/providers/motivation_quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DatabaseHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MotivationQuoteProvider>(context, listen: false);
    motivationQuotes.map((quote) async {
      return provider.insert(quote);
    });
    return Consumer<MotivationQuoteProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'Q U O T E S',
            ),
            centerTitle: true,
          ),
          body: FutureBuilder<List<MotivationQuote>>(
            future: provider.getAllQuotes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final quotes = snapshot.data!;
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
                      );
              }
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
