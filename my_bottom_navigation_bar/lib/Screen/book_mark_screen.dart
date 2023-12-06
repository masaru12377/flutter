import 'package:flutter/material.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り'),
      ),
      body: const Center(
        child: Text('お気に入り画面', style: TextStyle(fontSize: 32.0)),
      ),
    );
  }
}
