import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StockStoryTimelineTile extends StatelessWidget {
  const StockStoryTimelineTile({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    required this.isLong,
    required this.story,
    required this.dt,
    required this.prices,
    required this.storyId,
  });

  final bool isFirst;
  final bool isLast;
  final bool isLong;
  final String story;
  final List<int> prices;
  final DateTime dt;
  final int storyId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: const LineStyle(color: Colors.black54),
        indicatorStyle: IndicatorStyle(
            color: isLong ? Colors.red : Colors.indigo, width: 20),
        endChild: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: () {
              context.push('/stock-story/$storyId');
            },
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dt.toString().substring(0, 10),
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  isLong
                      ? Text(
                          '${prices.length}주 구매, 평균매입금액: ${prices.reduce((value, element) => value + element) ~/ prices.length}원',
                          style: const TextStyle(fontSize: 12),
                        )
                      : Text(
                          '${prices.length}주 판매, 평균매각금액: ${prices.reduce((value, element) => value + element) ~/ prices.length}원',
                          style: const TextStyle(fontSize: 12),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.fade,
                      story,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
