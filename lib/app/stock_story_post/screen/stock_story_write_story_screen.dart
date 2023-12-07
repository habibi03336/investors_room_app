import 'package:flutter/material.dart';

class StockStoryWriteStoryScreen extends StatelessWidget {
  const StockStoryWriteStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주식 이야기 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: const [
            TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '주식 구매/판매 하게된 이야기를 적어주세요.',
              ),
              minLines: 12,
              maxLines: 12,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child: TextButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const StockStoryPostPriceScreen(),
            //   ),
            // );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('등록 완료'),
            ],
          ),
        ),
      ),
    );
  }
}
