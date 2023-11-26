import 'package:flutter/material.dart';
import 'package:stock_story_app/app/own_stock/widget/stock_story_timeline_tile.dart';

import '../../../api/model/stock_story_model.dart';

class StockStoryTimelineWidget extends StatelessWidget {
  const StockStoryTimelineWidget({super.key, required this.stockStories});

  final List<StockStoryModel> stockStories;

  @override
  Widget build(BuildContext context) {
    final List<StockStoryTimelineTile> storyTiles = [];
    for (var i = 0; i < stockStories.length; i += 1) {
      storyTiles.add(
        StockStoryTimelineTile(
          isFirst: i == 0,
          isLast: i == stockStories.length - 1,
          isLong: stockStories[i].isLong,
          story: stockStories[i].story,
          prices: stockStories[i].stockPrices,
          dt: stockStories[i].dt,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(children: storyTiles),
    );
  }
}
