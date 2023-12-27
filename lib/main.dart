import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TapGame(),
    );
  }
}

class TapGame extends StatefulWidget {
  @override
  _TapGameState createState() => _TapGameState();
}

class _TapGameState extends State<TapGame> {
  int score = 0;
  int timeLeft = 30; // Game time in seconds
  bool isGameOver = true; // Game starts as "over"

  void startGame() {
    setState(() {
      score = 0;
      timeLeft = 30;
      isGameOver = false;
    });

    // Start a timer for the game duration
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          isGameOver = true;
          timer.cancel();
        }
      });
    });
  }

  void onTapButton() {
    if (!isGameOver) {
      setState(() {
        score++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap the Button Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Time Left: $timeLeft seconds',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isGameOver ? startGame : null,
              child: Text(isGameOver ? 'Start Game' : 'Tap Me!'),
            ),
          ],
        ),
      ),
    );
  }
}
