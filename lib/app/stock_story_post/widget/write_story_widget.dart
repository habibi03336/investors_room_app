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
          TextField(
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
