import 'package:stock_story_app/api/model/own_stock_model.dart';

class OwnStockAndMarketPriceModel {
  final OwnStockModel ownStockModel;
  final int marketPrice;

  OwnStockAndMarketPriceModel.fromOwnStockAndPrice(
      OwnStockModel ownStock, int price)
      : ownStockModel = ownStock,
        marketPrice = price;
}
