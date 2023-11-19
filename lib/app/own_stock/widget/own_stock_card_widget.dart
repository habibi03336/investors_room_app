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

    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2.0,
          color: Colors.black,
        ),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Text(ownStock.stockCode),
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
