import 'package:flutter/material.dart';
import 'package:stock_story_app/app/own_stock/screen/own_stock_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    OwnStockScreen(),
    Text(
      'Index 1: 기간별 손익',
      style: optionStyle,
    ),
    Text(
      'Index 2: 실현 손익',
      style: optionStyle,
    ),
    Text(
      'Index 2: 주식이야기 등록',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '소유한 자산',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '기간별 손익',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '실현 손익',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '주식이야기 등록',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
