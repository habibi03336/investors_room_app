import 'package:flutter/material.dart';
import 'package:stock_story_app/app/stock_story_post/screen/stock_story_write_story_screen.dart';
import 'package:stock_story_app/app/stock_story_post/widget/price_selection_widget.dart';

import '../widget/price_select_pad_widget.dart';

class StockStoryPostPriceScreen extends StatefulWidget {
  const StockStoryPostPriceScreen({super.key});

  @override
  State<StockStoryPostPriceScreen> createState() =>
      _StockStoryPostPriceScreenState();
}

class _StockStoryPostPriceScreenState extends State<StockStoryPostPriceScreen> {
  List<int> stockPrices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주식 이야기 등록'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PriceSelectionWidget(stockPrices: stockPrices),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            height: 300,
            child: PriceSelectPadWidget(
              onPriceSelect: (price) {
                setState(() {
                  stockPrices.add(price);
                });
              },
              centerPrice: 5000,
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
      bottomSheet: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StockStoryWriteStoryScreen(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('다음'),
            ],
          ),
        ),
      ),
    );
  }
}
