import 'dart:async';
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
      title: 'Life Manager',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? timer;
  DateTime? time;
  bool finished = false;
  int seconds = 100;
  int maxSeconds = 100;
  bool isRunning = false;

  void startTimer({bool reset = true}) {
    isRunning = true;
    if (reset) {
      resetTimer();
    }
    timer = Timer.periodic(const Duration(seconds: 1), // 1秒毎に定期実行
            (_) {
          if (seconds > 0) {
            setState(() => seconds--);
          } else {
            messageDialog(context, "終了！","ポップアップを閉じてください。");
            stopTimer(reset: false);
            seconds = maxSeconds;
          }
        });
  }

  void resetTimer() => setState(() => seconds = maxSeconds);

  void stopTimer({bool reset = true}) {
    isRunning = false;
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  //初期化処理
  @override
  void initState() {
    super.initState();
    startTimer(reset: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walking_page'),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildTimer(seconds: seconds, maxSeconds: maxSeconds),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*START/STOPボタンボタン*/
                ElevatedButton(
                  onPressed: () {
                    if(isRunning){
                      stopTimer(reset: false);
                    }else{
                      startTimer(reset:false);
                    }
                  },
                  child: Text(isRunning ? "STOP" : "START"),
                ),

                const SizedBox(width: 50),

                //RESETボタン
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: const Text("RESET"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuildTimer extends StatelessWidget {
  const BuildTimer(
      {super.key, required this.seconds, required this.maxSeconds});

  final int seconds;
  final int maxSeconds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - (seconds / maxSeconds),
            valueColor: const AlwaysStoppedAnimation(Colors.white),
            strokeWidth: 12,
            backgroundColor: Colors.greenAccent,
          ),
          Center(
            child: BuildTime(seconds: seconds),
          )
        ],
      ),
    );
  }
}

class BuildTime extends StatelessWidget {
  const BuildTime({super.key, required this.seconds});

  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$seconds',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 80,
      ),
    );
  }
}


messageDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: Text(message),
      actions: [
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("close"),
          ),
        )
      ],
    ),
  );
}


