import 'package:flutter/material.dart';

class PriceSelectionWidget extends StatelessWidget {
  const PriceSelectionWidget({super.key, required this.stockPrices});

  final List<int> stockPrices;

  @override
  Widget build(BuildContext context) {
    stockPrices.sort((a, b) => a - b);
    List<Widget> selectedPrices = [];
    int priorI = 0;
    int i = 0;
    while (stockPrices.isNotEmpty && i <= stockPrices.length) {
      if (i == stockPrices.length || stockPrices[priorI] != stockPrices[i]) {
        selectedPrices.add(
          Container(
            height: 36,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${stockPrices[priorI]}원',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${i - priorI}주',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
        priorI = i;
      }
      i += 1;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: selectedPrices),
      ),
    );
  }
}
