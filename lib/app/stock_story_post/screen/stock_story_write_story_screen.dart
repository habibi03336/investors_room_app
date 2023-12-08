import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_story_app/app/stock_story_post/model/stock_story_post_model.dart';

class StockStoryWriteStoryScreen extends StatelessWidget {
  const StockStoryWriteStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StockStoryPostModel>(
      builder: (context, stockStoryModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('주식 이야기 등록'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                onChanged: (String text) {
                  stockStoryModel.setStory(text);
                },
                autofocus: true,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '주식 구매/판매 하게된 이야기를 적어주세요.',
                ),
                minLines: 12,
                maxLines: 12,
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          child: TextButton(
            onPressed: () {
              print(stockStoryModel.stockCode);
              print(stockStoryModel.stockName);
              print(stockStoryModel.isLong);
              print(stockStoryModel.stockPrices);
              print(stockStoryModel.dt);
              print(stockStoryModel.story);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('등록 완료'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
