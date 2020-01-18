import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/pips.dart';
import 'dart:async';

class TimeLineView extends StatefulWidget {
  TimeLineView({
    Key key,
  }) : super(key: key);

  @override
  _TimeLineViewState createState() => _TimeLineViewState();
}

class _TimeLineViewState extends State<TimeLineView>
    with SingleTickerProviderStateMixin {
  final hours = List.generate(23, (i) => i++);
  final GlobalKey _columnKey = GlobalKey();
  ScrollController _controller;
  AnimationController _animationController;
  Animation<double> scrollAnim;
  Size columnSize;
  Offset columnPosition;
  DateTime _dateTime = DateTime.now();
  double _deviceHeight;
  Timer _timer;
  double _currentTimePos;
  double _previousTimePos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _currentTimePos = 0.0;
    _previousTimePos = 0.0;
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addListener(() => setState(() {}));
    _updateTime();

    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPos());
  }

  @override
  void didUpdateWidget(TimeLineView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  getSizeAndPos() {
    RenderBox _columnBox = _columnKey.currentContext.findRenderObject();
    print(_columnBox.size);
    columnSize = _columnBox.size;
    columnPosition = _columnBox.localToGlobal(Offset.zero);
    setState(() {});
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 10) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
    convertTime(_dateTime, columnSize, _controller);
  }

  void convertTime(
      DateTime dateTime, Size column, ScrollController controller) {
    if (column != null) {
      double _hourHeight = column.height / 24;
      double _minHeight = _hourHeight / 60;
      double hourPos =
          dateTime.hour * _hourHeight + (dateTime.minute * _minHeight);
      _previousTimePos = _currentTimePos;
      _currentTimePos = hourPos;
      scrollAnim = Tween(
              begin: _previousTimePos,
              end: dateTime.hour > 11
                  ? _currentTimePos + _deviceHeight
                  : _currentTimePos)
          .animate(_animationController);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List hours = List.generate(24, (i) => i++);
    _deviceHeight = MediaQuery.of(context).size.height / 3.3;

    return SingleChildScrollView(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      child: Transform.translate(
        offset: Offset(0.0,
            -(scrollAnim == null ? 0.0 : scrollAnim.value - _deviceHeight)),
        child: Column(key: _columnKey, children: <Widget>[
          for (int i in hours) ...[_hourSegment(i)],
        ]),
      ),
    );
  }
}

_hourSegment(int hour) {
  return Column(
    children: <Widget>[
      PipRow(hourIndex: hour, hourRatio: 180, width: 150, opacity: 1.0),
      PipRow(width: 55.0, opacity: 0.6),
      SizedBox(height: 40.0),
      PipRow(width: 95.0, opacity: 0.8),
      SizedBox(height: 40.0),
      PipRow(width: 55.0, opacity: 0.6),
    ],
  );
}
