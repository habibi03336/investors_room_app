import 'package:flutter/material.dart';
import 'package:stock_story_app/api/mock/stock_story_api.dart';
import 'package:stock_story_app/app/own_stock/widget/stock_story_timeline_widget.dart';
import '../model/own_stock_and_market_price_model.dart';

class DetailOwnStockScreen extends StatelessWidget {
  const DetailOwnStockScreen({
    super.key,
    required this.ownStockAndPrice,
  });

  final OwnStockAndMarketPriceModel ownStockAndPrice;

  @override
  Widget build(BuildContext context) {
    int profit =
        (ownStockAndPrice.marketPrice - ownStockAndPrice.averagePurchasePrice) *
            ownStockAndPrice.stockCount;
    int changeRate = ((ownStockAndPrice.marketPrice -
                ownStockAndPrice.averagePurchasePrice) /
            ownStockAndPrice.averagePurchasePrice *
            100)
        .toInt();
    return Scaffold(
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            foregroundColor: profit > 0 ? Colors.red[300] : Colors.blue[300],
            title: Text(ownStockAndPrice.stockName)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('현재주식가격',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${ownStockAndPrice.marketPrice}원',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('평균주식매입가격',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${ownStockAndPrice.averagePurchasePrice}원',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('소유주식수',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      Text('${ownStockAndPrice.stockCount} 주',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$changeRate%',
                  style: TextStyle(
                    fontSize: 80,
                    color: profit > 0 ? Colors.red[300] : Colors.blue[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '($profit원)',
                    style: TextStyle(
                      fontSize: 16,
                      color: profit > 0 ? Colors.red[300] : Colors.blue[300],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  future: StockStoryApi.getStockStoryOfCertainStock(
                      ownStockAndPrice.stockCode),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return StockStoryTimelineWidget(
                        stockStories: snapshot.data!,
                      );
                    }
                    return const Text("loading...");
                  }),
            )
          ]),
        ));
  }
}
