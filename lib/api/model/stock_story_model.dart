class StockStoryModel {
  final String stockCode;
  final List<int> stockPrices;
  final DateTime dt;
  final String story;
  final bool isLong;

  static DateTime parseDtStr(String dateStr) {
    List<int> dates = [for (var elem in dateStr.split("-")) int.parse(elem)];
    return DateTime(dates[0], dates[1], dates[2]);
  }

  StockStoryModel.fromJson(Map<String, dynamic> json)
      : stockCode = json['stockCode'],
        stockPrices = json['stockPrices'],
        isLong = json['isLong'],
        dt = StockStoryModel.parseDtStr(json['dt']),
        story = json['story'];
}
