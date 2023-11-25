import 'package:flutter/material.dart';
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
        (OwnStockCardWidget.calculateCardSize(b.ownStockModel, b.marketPrice) -
                OwnStockCardWidget.calculateCardSize(
                    a.ownStockModel, a.marketPrice))
            .toInt());
    return ownStocksWithMarketPrices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('소유한 주식'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FutureBuilder(
          future: integrateOwnStockAndPrice(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LayoutBuilder(builder: (ctx, contraints) {
                double lengthAdjustRatio = (contraints.maxWidth - 2) /
                    OwnStockCardWidget.calculateCardWidth(
                        snapshot.data![0].ownStockModel,
                        snapshot.data![0].marketPrice);
                return Wrap(
                  direction: Axis.horizontal,
                  children: [
                    for (var ownStockAndPrice in snapshot.data!)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 1),
                        child: OwnStockCardWidget(
                          ownStock: ownStockAndPrice.ownStockModel,
                          stockMarketPrice: ownStockAndPrice.marketPrice,
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
    );
  }
}
