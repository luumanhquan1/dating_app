import 'dart:async';

import 'package:flutter/material.dart';
class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer timer;
  int second =60;
  @override
  void initState() {
    timer=Timer.periodic(Duration(seconds: 1),(_){
      second=second-1;
      if(second==0){
        timer.cancel();
      }
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      second<10?'00:0$second':'00:$second',
      style: Theme.of(context).textTheme.headline1,
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}
