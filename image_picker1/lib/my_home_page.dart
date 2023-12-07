import 'dart:io';
import 'package:flutter/material.dart';

import 'image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              //画像選択済み（存在している）場合に表示する
              child: _image == null
                  ? Container(color: Colors.blue, width: 500, height: 500)
                  : Image.file(
                      _image!,
                      height: 500,
                      width: 500,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      _image = await getImageFormCamera();
                      //setState内で非同期処理はできない
                      setState(() {});
                    },
                    child: const Text("Camera")),
                const SizedBox(width: 30),
                ElevatedButton(
                    onPressed: () async {
                      _image = await getImageFormGallery();
                      setState(() {});
                    },
                    child: const Text("Gallery")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
