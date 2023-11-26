import 'package:flutter/material.dart';

class PriceSelectPadWidget extends StatelessWidget {
  const PriceSelectPadWidget(
      {super.key, required this.onPriceSelect, required this.centerPrice});

  final void Function(int) onPriceSelect;
  final int centerPrice;

  @override
  Widget build(BuildContext context) {
    List<int> prices = [];
    for (var i = 31; i > 0; i -= 1) {
      prices.add(centerPrice - i * 100);
    }
    for (var i = 0; i < 32; i += 1) {
      prices.add(centerPrice + i * 100);
    }
    List<Row> rows = [];
    for (var i = 0; i < 21; i += 1) {
      rows.add(
        Row(
          children: [
            PadTileWidget(
                price: prices[i * 3 + 0], onPriceSelect: onPriceSelect),
            PadTileWidget(
                price: prices[i * 3 + 1], onPriceSelect: onPriceSelect),
            PadTileWidget(
                price: prices[i * 3 + 2], onPriceSelect: onPriceSelect),
          ],
        ),
      );
    }
    return ListView.builder(
      controller: ScrollController(initialScrollOffset: 8 * 75),
      itemCount: 21,
      itemBuilder: (context, index) {
        return rows[index];
      },
    );
  }
}

class PadTileWidget extends StatelessWidget {
  const PadTileWidget({
    super.key,
    required this.price,
    required this.onPriceSelect,
  });

  final int price;
  final void Function(int) onPriceSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            onPriceSelect(price);
          },
          child: Center(
            child: Text('$price'),
          ),
        ),
      ),
    );
  }
}
