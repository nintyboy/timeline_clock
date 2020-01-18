import 'package:flutter/material.dart';
import '../helper/functions.dart';
import '../helper/palette.dart';

class PipRow extends StatefulWidget {
  PipRow({
    Key key,
    this.hourIndex,
    this.hourRatio,
    this.opacity,
    this.width,
    this.isActive,
  }) : super(key: key);
  double opacity, width, hourRatio;
  int hourIndex;
  bool isActive;

  @override
  _PipRowState createState() => _PipRowState();
}

class _PipRowState extends State<PipRow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hourIndex == null) {
      return Row(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
        ),
        Container(
          child: _Pips(
            opacity: widget.opacity,
            width: widget.width,
          ),
        )
      ]);
    } else {
      return Row(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: AnimatedDefaultTextStyle(
              style: Palette.hourStyle(widget.hourRatio, context),
              duration: Duration(milliseconds: 200),
              child: Text(
                widget.hourIndex.toString(),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),
        Container(
          child: _Pips(
            opacity: widget.opacity,
            width: widget.width,
          ),
        )
      ]);
    }
  }
}

// Internal Widgets

class _Pips extends StatelessWidget {
  _Pips({
    Key key,
    this.opacity,
    this.width,
  }) : super(key: key);
  double opacity;
  double width;
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacity,
        child: Container(
          height: Helper.toPixel(10.0, context),
          width: Helper.toPixel(width, context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Helper.toPixel(2.0, context)),
              color: Colors.white,
              boxShadow: [
                Palette.pipsShadow(context),
                Palette.pipsShadow(context),
              ]),
        ));
  }
}
