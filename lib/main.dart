import 'package:flutter/material.dart';

void main() {
  runApp(const GoodMorningApp());
}

class GoodMorningApp extends StatelessWidget {
  const GoodMorningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Good Morning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GoodMorningScreen(),
    );
  }
}

class GoodMorningScreen extends StatelessWidget {
  const GoodMorningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    String greeting;

    if (hour < 12) {
      greeting = 'Good Morning!';
    } else if (hour < 18) {
      greeting = 'Good Afternoon!';
    } else {
      greeting = 'Good Evening!';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Greetings App'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              greeting,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Time: ${TimeOfDay.now().format(context)}',
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Greeting updated!'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        tooltip: 'Refresh greeting',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
