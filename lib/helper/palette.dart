import 'package:flutter/material.dart';
import 'functions.dart';

class Palette {
  static Color orange = Color.fromRGBO(247, 130, 26, 1.0);
  static Color bgColor = Color.fromRGBO(46, 47, 48, 1.0);

  static LinearGradient bgToZero(Alignment begin, Alignment end) {
    return LinearGradient(
      begin: begin,
      end: end,
      stops: [0.55, 1.0],
      colors: [
        bgColor,
        bgColor.withOpacity(0.0),
      ],
    );
  }

  static BoxShadow pipsShadow(context) {
    return BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        blurRadius: Helper.toPixel(5.0, context),
        spreadRadius: Helper.toPixel(1.0, context),
        offset:
            Offset(Helper.toPixel(0.0, context), Helper.toPixel(3.0, context)));
  }

  static TextStyle hourStyle(double fontSize, context) {
    return TextStyle(
        fontFamily: 'Circular',
        shadows: [
          Shadow(
              color: Colors.black26,
              blurRadius: Helper.toPixel(5.0, context),
              offset: Offset(
                  Helper.toPixel(0.0, context), Helper.toPixel(3.0, context)))
        ],
//        height: 0.82,
        color: Color.fromRGBO(255, 255, 255, 1.0),
        fontSize: Helper.toPixel(fontSize, context),
        fontWeight: FontWeight.w500);
  }
}
