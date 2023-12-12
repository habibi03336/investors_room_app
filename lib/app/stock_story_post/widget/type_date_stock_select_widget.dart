import 'package:flutter/material.dart';

import '../model/stock_story_post_model.dart';

class TypeDateStockSelectWidget extends StatelessWidget {
  const TypeDateStockSelectWidget({
    super.key,
    required this.stockStoryPostModel,
  });
  final StockStoryPostModel stockStoryPostModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: TextEditingController(
                text: stockStoryPostModel.dt.toString().substring(0, 10)),
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
              if (pickedDate != null && pickedDate != stockStoryPostModel.dt) {
                stockStoryPostModel.setDt(pickedDate);
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return ToggleButtons(
                color: Colors.black,
                selectedColor: Colors.black,
                selectedBorderColor: Colors.black,
                fillColor: Colors.black26,
                constraints: BoxConstraints.expand(
                    width: (constraints.maxWidth - 3) / 2),
                isSelected: [
                  stockStoryPostModel.isLong,
                  !stockStoryPostModel.isLong
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
                    stockStoryPostModel.setIsLong(true);
                  } else {
                    stockStoryPostModel.setIsLong(false);
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Autocomplete<String>(
            initialValue: TextEditingValue(
              text: stockStoryPostModel.stockName,
            ),
            fieldViewBuilder:
                ((context, textEditingController, focusNode, onFieldSubmitted) {
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
              stockStoryPostModel.setStockNameAndCode(option, option);
            },
          ),
        ],
      ),
    );
  }
}
