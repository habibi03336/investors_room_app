import 'package:flutter/widgets.dart';

class StockStoryPostModel extends ChangeNotifier {
  String stockName = '';
  String stockCode = '';
  String story = '';
  bool isLong = true;
  DateTime dt = DateTime.now();
  List<int> stockPrices = [];

  void setStockNameAndCode(String stockName, String stockCode) {
    this.stockCode = stockCode;
    this.stockName = stockName;
    notifyListeners();
  }

  void setIsLong(bool isLong) {
    this.isLong = isLong;
    notifyListeners();
  }

  void setDt(DateTime dt) {
    this.dt = dt;
    notifyListeners();
  }

  void addStockPrice(int stockPrice) {
    stockPrices.add(stockPrice);
    notifyListeners();
  }

  void removeStockPrice(int stockPrice) {
    stockPrices.remove(stockPrice);
    notifyListeners();
  }

  void setStory(String story) {
    this.story = story;
    notifyListeners();
  }

  void clear() {
    stockName = '';
    stockCode = '';
    story = '';
    isLong = true;
    dt = DateTime.now();
    stockPrices = [];
  }
}
