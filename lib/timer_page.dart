import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _time = 10; // Default time in seconds
  int _remainingTime = 10;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _remainingTime = _time;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingTime = _time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _remainingTime.toString().padLeft(2, '0'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _startTimer, child: Text('Start')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _pauseTimer, child: Text('Pause')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _resetTimer, child: Text('Reset')),
          ],
        ),
        Slider(
          value: _time.toDouble(),
          min: 1,
          max: 120,
          divisions: 119,
          label: _time.toString(),
          onChanged: (value) {
            setState(() {
              _time = value.toInt();
              _remainingTime = _time;
            });
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
