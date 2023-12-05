import 'package:flutter/material.dart';
import 'package:stock_story_app/app/own_stock/screen/own_stock_screen.dart';
import 'package:stock_story_app/navigation/botton_navigation.dart';

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
        home: const OwnStockScreen());
  }
}
