import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アナリティクス'),
      ),
      body: const Center(
        child: Text('アナリティクス画面', style: TextStyle(fontSize: 32.0)),
      ),
    );
  }
}
