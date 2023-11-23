class RealizedStockModel {
  final String stockCode;
  final int stockCount;
  final int averageSellPrice;
  final int averagePurchasePrice;

  RealizedStockModel.fromJson(Map<String, dynamic> json)
      : stockCode = json['stockCode'],
        stockCount = json['stockCount'],
        averageSellPrice = json['averageSellPrice'],
        averagePurchasePrice = json['averagePurchasePrice'];
}
