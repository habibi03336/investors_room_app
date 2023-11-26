import 'package:flutter/material.dart';

import '../widget/price_select_pad_widget.dart';

class StockStoryPostScreen extends StatefulWidget {
  const StockStoryPostScreen({super.key});

  @override
  State<StockStoryPostScreen> createState() => _StockStoryPostScreenState();
}

class _StockStoryPostScreenState extends State<StockStoryPostScreen> {
  String stockCode = '';
  List<int> stockPrices = [];
  DateTime positionDt = DateTime.now();
  bool isLong = true;
  String story = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주식 이야기 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
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
                stockCode = option;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return ToggleButtons(
                  constraints: BoxConstraints.expand(
                      width: (constraints.maxWidth - 3) / 2),
                  isSelected: [isLong, !isLong],
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
                      isLong = true;
                    } else {
                      isLong = false;
                    }
                    setState(() {});
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: TextEditingController(
                  text: positionDt.toString().substring(0, 10)),
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
                if (pickedDate != null && pickedDate != positionDt) {
                  setState(() {
                    positionDt = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5),
                    builder: (context) {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.43,
                            child: PriceSelectPadWidget(
                              onPriceSelect: (price) {
                                setState(() {
                                  stockPrices.add(price);
                                });
                              },
                              centerPrice: 5000,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('가격 선택 완료'),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Expanded(child: Center(child: Text('가격 등록'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
