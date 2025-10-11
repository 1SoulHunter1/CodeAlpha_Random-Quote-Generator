import 'package:flutter/material.dart';
import 'package:quote_generator/quote_screen.dart'; // Import the new screen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Point the home to the QuoteScreen widget
      home: const QuoteScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
