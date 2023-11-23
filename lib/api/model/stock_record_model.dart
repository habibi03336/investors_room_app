class StockRecordModel {
  final String stockCode;
  final DateTime dt;
  final int stockPrice;

  static DateTime parseDtStr(String dateStr) {
    List<int> dates = [for (var elem in dateStr.split("-")) int.parse(elem)];
    return DateTime(dates[0], dates[1], dates[2]);
  }

  StockRecordModel.fromJson(Map<String, dynamic> json)
      : stockCode = json['stockCode'],
        stockPrice = json['stockPrice'],
        dt = StockRecordModel.parseDtStr(json['dt']);
}
