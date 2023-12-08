import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_story_app/app/stock_story_post/model/stock_story_post_model.dart';
import 'package:stock_story_app/app/stock_story_post/screen/stock_story_post_price_screen.dart';

class StockStoryPostScreen extends StatefulWidget {
  const StockStoryPostScreen({super.key});

  @override
  State<StockStoryPostScreen> createState() => _StockStoryPostScreenState();
}

class _StockStoryPostScreenState extends State<StockStoryPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StockStoryPostModel>(
        builder: (context, stockStoryModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('주식 이야기 등록'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return ToggleButtons(
                    constraints: BoxConstraints.expand(
                        width: (constraints.maxWidth - 3) / 2),
                    isSelected: [
                      stockStoryModel.isLong,
                      !stockStoryModel.isLong
                    ],
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('주식 구매'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('주식 판매'),
                      )
                    ],
                    onPressed: (index) {
                      if (index == 0) {
                        stockStoryModel.setIsLong(true);
                      } else {
                        stockStoryModel.setIsLong(false);
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: TextEditingController(
                    text: stockStoryModel.dt.toString().substring(0, 10)),
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "주식 구매/판매 일자" //label text of field
                    ),
                readOnly: true, // when true user cannot edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null && pickedDate != stockStoryModel.dt) {
                    stockStoryModel.setDt(pickedDate);
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Autocomplete<String>(
                fieldViewBuilder: ((context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onFieldSubmitted,
                    decoration: const InputDecoration(hintText: '주식 검색'),
                  );
                }),
                optionsBuilder: (token) {
                  if (token.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return ['asdf', 'asdf'];
                },
                onSelected: (option) {
                  stockStoryModel.setStockNameAndCode(option, option);
                },
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StockStoryPostPriceScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('다음'),
              ],
            ),
          ),
        ),
      );
    });
  }
}
