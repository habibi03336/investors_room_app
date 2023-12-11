import 'package:flutter/material.dart';
import '../model/stock_story_post_model.dart';

class WriteStoryWidget extends StatelessWidget {
  const WriteStoryWidget({
    super.key,
    required this.stockStoryPostModel,
  });
  final StockStoryPostModel stockStoryPostModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('주식이름',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    stockStoryPostModel.stockName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(stockStoryPostModel.isLong ? '평균매입가격' : '평균판매가격',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      '${stockStoryPostModel.stockPrices.reduce((value, element) => value + element) ~/ stockStoryPostModel.stockPrices.length}원',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('총투자금액',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(
                      '${stockStoryPostModel.stockPrices.reduce((value, element) => value + element)}원',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            initialValue: stockStoryPostModel.story,
            onChanged: (String text) {
              stockStoryPostModel.setStory(text);
            },
            autofocus: true,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '주식 구매/판매 하게된 이야기를 적어주세요.',
            ),
            minLines: 12,
            maxLines: 12,
          ),
        ],
      ),
    );
  }
}
