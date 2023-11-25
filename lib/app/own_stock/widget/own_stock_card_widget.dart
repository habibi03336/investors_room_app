import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stock_story_app/api/model/own_stock_model.dart';

class OwnStockCardWidget extends StatelessWidget {
  final OwnStockModel ownStock;
  final int stockMarketPrice;
  final double lengthAdjustRatio;

  const OwnStockCardWidget(
      {super.key,
      required this.ownStock,
      required this.stockMarketPrice,
      required this.lengthAdjustRatio});

  @override
  Widget build(BuildContext context) {
    final double height =
        OwnStockCardWidget.calculateCardHeight(ownStock, stockMarketPrice) *
            lengthAdjustRatio;
    final double width =
        OwnStockCardWidget.calculateCardWidth(ownStock, stockMarketPrice) *
            lengthAdjustRatio;

    int profit = (stockMarketPrice - ownStock.averagePurchasePrice) *
        ownStock.stockCount;
    int changeRate = ((stockMarketPrice - ownStock.averagePurchasePrice) /
            ownStock.averagePurchasePrice *
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
                      ownStock.stockName,
                      style: TextStyle(
                          fontSize: width / 10, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ownStock.stockCode,
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
      OwnStockModel ownStock, int stockMarketPrice) {
    final double cardSize = calculateCardSize(ownStock, stockMarketPrice);
    final double parametricValue =
        sqrt(cardSize / (stockMarketPrice * ownStock.averagePurchasePrice));
    return stockMarketPrice * parametricValue;
  }

  static double calculateCardWidth(
      OwnStockModel ownStock, int stockMarketPrice) {
    double cardSize = calculateCardSize(ownStock, stockMarketPrice);
    final double parametricValue =
        sqrt(cardSize / (stockMarketPrice * ownStock.averagePurchasePrice));
    return ownStock.averagePurchasePrice * parametricValue;
  }

  static double calculateCardSize(
      OwnStockModel ownStock, int stockMarketPrice) {
    final double cardSize =
        ((ownStock.averagePurchasePrice + stockMarketPrice) / 2) *
            ownStock.stockCount;
    return cardSize;
  }
}
