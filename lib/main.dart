import 'package:daily_motivation/pages/homepage.dart';
import 'package:daily_motivation/pages/web_home_page.dart';
import 'package:daily_motivation/providers/motivation_quote_provider.dart';
import 'package:daily_motivation/themes/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MotivationQuoteProvider(),
    child: const MotivationApp(),
  ));
}

class MotivationApp extends StatelessWidget {
  const MotivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: kIsWeb ? const WebHomePage() : const HomePage(),
      theme: lightModeAmber,
      debugShowCheckedModeBanner: false,
    );
  }
}
