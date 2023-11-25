import 'package:stock_story_app/api/model/own_stock_model.dart';

class OwnStockAndMarketPriceModel {
  final String stockName;
  final String stockCode;
  final int stockCount;
  final int averagePurchasePrice;
  final int marketPrice;

  OwnStockAndMarketPriceModel.fromOwnStockAndPrice(
      OwnStockModel ownStock, int price)
      : stockName = ownStock.stockName,
        stockCode = ownStock.stockCode,
        averagePurchasePrice = ownStock.averagePurchasePrice,
        stockCount = ownStock.stockCount,
        marketPrice = price;
}
