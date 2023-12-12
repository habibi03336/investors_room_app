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
    if ((step == 1 || step == 2) &&
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
        backgroundColor: step != 2 ? Colors.black : Colors.white,
        foregroundColor: step != 2 ? Colors.white : Colors.black,
        elevation: 0,
        title: const Text('새로운 주식이야기',
            style: TextStyle(
              textBaseline: TextBaseline.alphabetic,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
        leading: step == 0
            ? IconButton(
                icon: const Icon(Icons.close_sharp),
                onPressed: () {
                  context.pop();
                },
                iconSize: 32,
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  setState(() {
                    step -= 1;
                  });
                },
                iconSize: 24,
              ),
        actions: [
          if (step != 2)
            TextButton(
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: step == 0
          ? TypeDateStockSelectWidget(stockStoryPostModel: stockStoryPostModel)
          : step == 1
              ? PriceSelectWidget(stockStoryPostModel: stockStoryPostModel)
              : WriteStoryWidget(stockStoryPostModel: stockStoryPostModel),
      bottomSheet: step == 2
          ? Container(
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
                  print(stockStoryPostModel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '등록하기',
                      style: TextStyle(
                        color: nextStepAvailable(step, stockStoryPostModel)
                            ? Colors.white
                            : Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Text(''),
    );
  }
}
