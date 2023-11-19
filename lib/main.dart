import 'package:flutter/material.dart';

void main() {
  runApp(const StockStoryApp());
}

class StockStoryApp extends StatelessWidget {
  const StockStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockStoryApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Text('StockStoryApp'),
    );
  }
}
