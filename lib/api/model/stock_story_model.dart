class StockStoryModel {
  final String stockCode;
  final List<int> stockPrices;
  final DateTime dt;
  final String story;

  static DateTime parseDtStr(String dateStr) {
    List<int> dates = [for (var elem in dateStr.split("-")) int.parse(elem)];
    return DateTime(dates[0], dates[1], dates[2]);
  }

  StockStoryModel.fromJson(Map<String, dynamic> json)
      : stockCode = json['stockCode'],
        stockPrices = json['stockPrices'],
        dt = StockStoryModel.parseDtStr(json['dt']),
        story = json['story'];
}
