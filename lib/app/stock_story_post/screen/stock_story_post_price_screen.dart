import 'package:flutter/material.dart';
import 'package:stock_story_app/app/stock_story_post/widget/price_select_pad_widget.dart';

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
    List<Row> selectedPrices = [];
    int priorI = 0;
    for (var i = 0; i < stockPrices.length; i += 1) {
      if (stockPrices[priorI] != stockPrices[i]) {
        selectedPrices.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${stockPrices[priorI]}'),
              Text('${i - priorI}주'),
            ],
          ),
        );
        priorI = i;
      }
    }
    if (stockPrices.isNotEmpty) {
      selectedPrices.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('${stockPrices[priorI]}'),
            Text('${stockPrices.length - priorI}주'),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('주식 이야기 등록'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: selectedPrices),
          ),
          SizedBox(
            height: 300,
            child: PriceSelectPadWidget(
              onPriceSelect: (price) {
                setState(() {
                  stockPrices.add(price);
                  stockPrices.sort((a, b) => a - b);
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
                builder: (context) => const StockStoryPostPriceScreen(),
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
