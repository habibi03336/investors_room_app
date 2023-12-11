import 'package:flutter/material.dart';

import '../model/stock_story_post_model.dart';

class PriceSelectWidget extends StatelessWidget {
  const PriceSelectWidget({super.key, required this.stockStoryPostModel});
  final StockStoryPostModel stockStoryPostModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: PriceSelectionWidget(
          stockPrices: stockStoryPostModel.stockPrices,
          onPressArrowUp: (price) {
            stockStoryPostModel.addStockPrice(price);
          },
          onPressArrowDown: (price) {
            stockStoryPostModel.removeStockPrice(price);
          },
        )),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 300,
          child: PriceSelectPadWidget(
            onPriceSelect: (price) {
              stockStoryPostModel.addStockPrice(price);
            },
            centerPrice: 5000,
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}

class PriceSelectPadWidget extends StatelessWidget {
  const PriceSelectPadWidget(
      {super.key, required this.onPriceSelect, required this.centerPrice});

  final void Function(int) onPriceSelect;
  final int centerPrice;

  @override
  Widget build(BuildContext context) {
    List<int> prices = [];
    for (var i = 31; i > 0; i -= 1) {
      prices.add(centerPrice - i * 100);
    }
    for (var i = 0; i < 32; i += 1) {
      prices.add(centerPrice + i * 100);
    }
    List<Row> rows = [];
    for (var i = 0; i < 21; i += 1) {
      rows.add(
        Row(
          children: [
            PadTileWidget(
                price: prices[i * 3 + 0], onPriceSelect: onPriceSelect),
            PadTileWidget(
                price: prices[i * 3 + 1], onPriceSelect: onPriceSelect),
            PadTileWidget(
                price: prices[i * 3 + 2], onPriceSelect: onPriceSelect),
          ],
        ),
      );
    }
    return ListView.builder(
      controller: ScrollController(initialScrollOffset: 8 * 75),
      itemCount: 21,
      itemBuilder: (context, index) {
        return rows[index];
      },
    );
  }
}

class PriceSelectionWidget extends StatelessWidget {
  const PriceSelectionWidget({
    super.key,
    required this.stockPrices,
    required this.onPressArrowUp,
    required this.onPressArrowDown,
  });

  final List<int> stockPrices;
  final Function onPressArrowUp;
  final Function onPressArrowDown;

  @override
  Widget build(BuildContext context) {
    stockPrices.sort((a, b) => a - b);
    List<Widget> selectedPrices = [];
    int priorI = 0;
    int i = 0;
    while (stockPrices.isNotEmpty && i <= stockPrices.length) {
      if (i == stockPrices.length || stockPrices[priorI] != stockPrices[i]) {
        var price = stockPrices[priorI];
        selectedPrices.add(
          Container(
            height: 36,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$price원',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => onPressArrowUp(price),
                      icon: const Icon(Icons.arrow_drop_up),
                      padding: EdgeInsets.zero,
                      iconSize: 36,
                    ),
                    Text(
                      '${i - priorI}주',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () => onPressArrowDown(price),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      padding: EdgeInsets.zero,
                      iconSize: 36,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        priorI = i;
      }
      i += 1;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: selectedPrices),
      ),
    );
  }
}

class PadTileWidget extends StatelessWidget {
  const PadTileWidget({
    super.key,
    required this.price,
    required this.onPriceSelect,
  });

  final int price;
  final void Function(int) onPriceSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            onPriceSelect(price);
          },
          child: Center(
            child: Text('$price'),
          ),
        ),
      ),
    );
  }
}
