import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stock_story_app/app/own_stock/model/own_stock_and_market_price_model.dart';

class OwnStockCardWidget extends StatelessWidget {
  final OwnStockAndMarketPriceModel ownStockAndPrice;
  final double lengthAdjustRatio;

  const OwnStockCardWidget(
      {super.key,
      required this.lengthAdjustRatio,
      required this.ownStockAndPrice});

  @override
  Widget build(BuildContext context) {
    final double height =
        OwnStockCardWidget.calculateCardHeight(ownStockAndPrice) *
            lengthAdjustRatio;
    final double width =
        OwnStockCardWidget.calculateCardWidth(ownStockAndPrice) *
            lengthAdjustRatio;

    int profit =
        (ownStockAndPrice.marketPrice - ownStockAndPrice.averagePurchasePrice) *
            ownStockAndPrice.stockCount;
    int changeRate = ((ownStockAndPrice.marketPrice -
                ownStockAndPrice.averagePurchasePrice) /
            ownStockAndPrice.averagePurchasePrice *
            100)
        .toInt();

    return Container(
      decoration: BoxDecoration(
        color: profit < 0 ? Colors.blue[300] : Colors.red[300],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2.0,
          color: Colors.black,
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ownStockAndPrice.stockName,
                      style: TextStyle(
                          fontSize: width / 10, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ownStockAndPrice.stockCode,
                      style: TextStyle(
                          fontSize: width / 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${profit > 0 ? '+' : ''}$changeRate%',
                            style: TextStyle(fontSize: width / 6)),
                        Text('(${profit > 0 ? '+' : ''}$profit원)',
                            style: TextStyle(fontSize: width / 20))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static double calculateCardHeight(
      OwnStockAndMarketPriceModel ownStockAndPrice) {
    final double cardSize = calculateCardSize(ownStockAndPrice);
    final double parametricValue = sqrt(cardSize /
        (ownStockAndPrice.marketPrice * ownStockAndPrice.averagePurchasePrice));
    return ownStockAndPrice.marketPrice * parametricValue;
  }

  static double calculateCardWidth(
      OwnStockAndMarketPriceModel ownStockAndPrice) {
    double cardSize = calculateCardSize(ownStockAndPrice);
    final double parametricValue = sqrt(cardSize /
        (ownStockAndPrice.marketPrice * ownStockAndPrice.averagePurchasePrice));
    return ownStockAndPrice.averagePurchasePrice * parametricValue;
  }

  static double calculateCardSize(
      OwnStockAndMarketPriceModel ownStockAndPrice) {
    final double cardSize = ((ownStockAndPrice.averagePurchasePrice +
                ownStockAndPrice.marketPrice) /
            2) *
        ownStockAndPrice.stockCount;
    return cardSize;
  }
}
