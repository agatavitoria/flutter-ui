import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/circle_container.dart';

class Cronometro extends StatefulWidget {
  final double initTime, fontSize;

  const Cronometro({Key key, this.initTime = 0, this.fontSize = 20}) : super(key: key);
  
  @override
  _CronometroState createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> {
  double _time;
  Timer _timer;

  @override
  void initState() {
    super.initState(); 
    _time = widget.initTime;
  }

  @override
  void dispose() {
    _stop();
    print('dispose');
    super.dispose();
  }

  void _start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time += 1;
      });
    });
  }

  void _stop() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(_time.toString(), style: TextStyle(fontSize: widget.fontSize)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: CircleContainer(child: Icon(Icons.play_arrow), size: 55), 
                onPressed: _start,
              ),
              CupertinoButton(
                child: CircleContainer(child: Icon(Icons.stop), size: 55), 
                onPressed: _stop,
              ),
            ],
          ),
        ],
      ),
    );
  }
}