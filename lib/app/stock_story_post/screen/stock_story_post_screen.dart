import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_story_app/app/stock_story_post/model/stock_story_post_model.dart';
import 'package:stock_story_app/app/stock_story_post/widget/price_select_widget.dart';
import 'package:stock_story_app/app/stock_story_post/widget/write_story_widget.dart';

import '../widget/type_date_stock_select_widget.dart';

class StockStoryPostScreen extends StatefulWidget {
  const StockStoryPostScreen({super.key});

  @override
  State<StockStoryPostScreen> createState() => _StockStoryPostScreenState();
}

class _StockStoryPostScreenState extends State<StockStoryPostScreen> {
  int step = 0;
  final StockStoryPostModel stockStoryPostModel = StockStoryPostModel();

  @override
  void initState() {
    super.initState();
    stockStoryPostModel.addListener(() {
      setState(() {});
    });
  }

  bool nextStepAvailable(int step, StockStoryPostModel stockStoryPostModel) {
    if (step == 0 &&
        stockStoryPostModel.stockCode != '' &&
        stockStoryPostModel.stockName != '') {
      return true;
    }
    if (step == 1 &&
        stockStoryPostModel.stockCode != '' &&
        stockStoryPostModel.stockName != '' &&
        stockStoryPostModel.stockPrices.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주식 이야기 등록'),
        leading: step == 0
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.pop();
                },
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    step -= 1;
                  });
                },
              ),
      ),
      body: step == 0
          ? TypeDateStockSelectWidget(stockStoryPostModel: stockStoryPostModel)
          : step == 1
              ? PriceSelectWidget(stockStoryPostModel: stockStoryPostModel)
              : WriteStoryWidget(stockStoryPostModel: stockStoryPostModel),
      bottomSheet: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: TextButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Colors.black,
          )),
          onPressed: () {
            if (nextStepAvailable(step, stockStoryPostModel)) {
              setState(() {
                step += 1;
              });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '다음',
                style: TextStyle(
                  color: nextStepAvailable(step, stockStoryPostModel)
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
