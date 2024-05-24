import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {});
      });
    }
  }

  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      setState(() {});
    }
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') + ':' +
          (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') + ':' +
          (_stopwatch.elapsed.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0'),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _startStopwatch, child: Text('Start')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _stopStopwatch, child: Text('Stop')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _resetStopwatch, child: Text('Reset')),
          ],
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
