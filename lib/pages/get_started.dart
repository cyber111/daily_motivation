import 'package:daily_motivation/pages/home_page.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 35),
              //Message
              const Text(
                'Get ready for your daily dose of motivation !!',
                style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 100),
              //Button
              IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    )),
                icon: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
