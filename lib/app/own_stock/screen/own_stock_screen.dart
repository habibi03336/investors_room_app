import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_story_app/api/mock/stock_market_api.dart';
import 'package:stock_story_app/api/mock/stock_story_api.dart';
import 'package:stock_story_app/app/own_stock/widget/own_stock_card_widget.dart';
import 'package:stock_story_app/app/own_stock/model/own_stock_and_market_price_model.dart';

class OwnStockScreen extends StatelessWidget {
  const OwnStockScreen({super.key});

  Future<List<OwnStockAndMarketPriceModel>> integrateOwnStockAndPrice() async {
    List<OwnStockAndMarketPriceModel> ownStocksWithMarketPrices = [];
    final ownStocks = await StockStoryApi.getOwnStocks();
    for (var ownStock in ownStocks) {
      ownStocksWithMarketPrices.add(
          OwnStockAndMarketPriceModel.fromOwnStockAndPrice(
              ownStock,
              await StockMarketApi.getStockMarketPriceByStockCode(
                  ownStock.stockCode)));
    }
    ownStocksWithMarketPrices.sort((a, b) =>
        (OwnStockCardWidget.calculateCardSize(b) -
                OwnStockCardWidget.calculateCardSize(a))
            .toInt());
    return ownStocksWithMarketPrices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              '장투는 맛있다',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
              onPressed: () {
                context.push('/post-stock-story');
              },
              icon: const Icon(
                Icons.add_circle_outline,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: integrateOwnStockAndPrice(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LayoutBuilder(builder: (ctx, contraints) {
                  double lengthAdjustRatio = (contraints.maxWidth - 2) /
                      OwnStockCardWidget.calculateCardWidth(snapshot.data![0]);
                  return Wrap(
                    direction: Axis.horizontal,
                    children: [
                      for (var ownStockAndPrice in snapshot.data!)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 1),
                          child: OwnStockCardWidget(
                            ownStockAndPrice: ownStockAndPrice,
                            lengthAdjustRatio: lengthAdjustRatio,
                          ),
                        )
                    ],
                  );
                });
              }
              return const Text('loading...');
            },
          ),
        ),
      ),
    );
  }
}
