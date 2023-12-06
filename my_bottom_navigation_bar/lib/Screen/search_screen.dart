import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索'),
      ),
      body: const Center(
        child: Text('検索画面', style: TextStyle(fontSize: 32.0)),
      ),
    );
  }
}
