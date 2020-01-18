import 'package:flutter/material.dart';
//import 'helper/functions.dart';
import 'helper/palette.dart';

// Components
import 'package:timeline_clock/components/timeline.dart';

import 'package:timeline_clock/components/overlay.dart';
import 'package:timeline_clock/components/timeLineView.dart';

class TimelineClock extends StatefulWidget {
  @override
  _TimelineClockState createState() => _TimelineClockState();
}

class _TimelineClockState extends State<TimelineClock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Palette.bgColor,
        body: SafeArea(
          child: Center(
              child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TimeLineView(),
            ),
            timeLine(),
            Overlays(),
          ])),
        ),
      ),
    );
  }
}
