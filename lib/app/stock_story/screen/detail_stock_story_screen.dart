import 'package:flutter/material.dart';

import '../../../api/mock/stock_story_api.dart';
import '../../../api/model/stock_story_model.dart';

class DetailStockStoryScreen extends StatelessWidget {
  const DetailStockStoryScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: StockStoryApi.getStockStoryById(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            StockStoryModel stockStoryModel = snapshot.data!;
            return Column(
              children: [
                Text(
                  '${stockStoryModel.dt.toString().substring(0, 4)}년 ${stockStoryModel.dt.toString().substring(5, 7)}월 ${stockStoryModel.dt.toString().substring(8, 10)}일',
                ),
                Text('"${stockStoryModel.story}"해서'),
                Text('${stockStoryModel.stockName}를'),
                Text(
                    '평균 ${stockStoryModel.stockPrices.reduce((val, elem) => val + elem) ~/ stockStoryModel.stockPrices.length}원에'),
                Text(
                    '${stockStoryModel.stockPrices.length}주를 ${stockStoryModel.isLong ? '구매하여' : '판매하여'} '),
                Text(
                    '총 ${stockStoryModel.stockPrices.reduce((val, elem) => val + elem)}를 ${stockStoryModel.isLong ? '투자하였습니다.' : '회수하였습니다.'}')
              ],
            );
          } else {
            return const Text('loading...');
          }
        },
      ),
    );
  }
}
