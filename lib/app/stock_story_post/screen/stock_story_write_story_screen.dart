import 'package:flutter/material.dart';

class StockStoryWriteStoryScreen extends StatelessWidget {
  const StockStoryWriteStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주식 이야기 등록'),
      ),
      body: Column(),
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
