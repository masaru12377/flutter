import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tag1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tags = [
    'ビール',
    'ワイン',
    '日本酒',
    '焼酎',
    'ウィスキー',
    'ジン',
    'ウォッカ',
    '紹興酒',
    'マッコリ',
    'カクテル',
    '果実酒',
  ];

  // 選択されたタグ
  var selectedTags = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            runSpacing: 16,
            spacing: 16,
            children: tags.map((tag) {
              //selectedTagsの中に自分がいるかを確かめる
              final isSelected = selectedTags.contains(tag);
              return InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                onTap: () {
                  //tagがtapされたときの処理
                  if (isSelected) {
                    //すでに選択されていれば取り除く
                    selectedTags.remove(tag);
                  } else {
                    //選択されていなければ追加する
                    selectedTags.add(tag);
                  }
                  setState(() {});
                },
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    border: Border.all(
                      width: 2,
                      color: Colors.blue,
                    ),
                    color: isSelected ? Colors.blue : null,
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectedTags.clear();
                  setState(() {});
                },
                child: const Text('クリア'),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                  onPressed: () {
                    //deep copyする方法
                    //selectedTags = tags だと参照を渡したことにしかならない
                    selectedTags = List.of(tags);
                    setState(() {});
                  },
                  child: const Text('全選択'))
            ],
          )
        ],
      ),
    );
  }
}
