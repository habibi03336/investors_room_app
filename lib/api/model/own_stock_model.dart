class OwnStockModel {
  final String stockName;
  final String stockCode;
  final int stockCount, averagePurchasePrice;

  OwnStockModel.fromJson(Map<String, dynamic> json)
      : stockName = json['stockName'],
        stockCode = json['stockCode'],
        stockCount = json['stockCount'],
        averagePurchasePrice = json['averagePurchasePrice'];

  // this method is for dev purpose without api.
  OwnStockModel.fromParams(this.stockName, this.stockCode, this.stockCount,
      this.averagePurchasePrice);
}
