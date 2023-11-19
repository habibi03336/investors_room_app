class OwnStockModel {
  final String stockCode;
  final int stockCount, averagePurchasePrice;

  OwnStockModel.fromJson(Map<String, dynamic> json)
      : stockCode = json['stockCode'],
        stockCount = json['stockCount'],
        averagePurchasePrice = json['averagePurchasePrice'];

  // this method is for dev purpose without api.
  OwnStockModel.fromParams(
      this.stockCode, this.stockCount, this.averagePurchasePrice);
}
