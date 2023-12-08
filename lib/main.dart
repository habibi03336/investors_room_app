import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_story_app/app/own_stock/screen/own_stock_screen.dart';

import 'app/stock_story_post/model/stock_story_post_model.dart';

void main() {
  runApp(const StockStoryApp());
}

class StockStoryApp extends StatelessWidget {
  const StockStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StockStoryPostModel(),
      child: MaterialApp(
        title: 'StockStoryApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OwnStockScreen(),
      ),
    );
  }
}
