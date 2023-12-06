import 'package:flutter/material.dart';
import 'package:my_bottom_navigation_bar/Screen/analysis_screen.dart';
import 'package:my_bottom_navigation_bar/Screen/book_mark_screen.dart';
import 'package:my_bottom_navigation_bar/Screen/search_screen.dart';

import 'Screen/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _screens = [
    HomeScreen(),
    AnalysisScreen(),
    SearchScreen(),
    BookMarkScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: '分析'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: '検索'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'お気に入り'),
          ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
