import 'package:flutter/material.dart';

class Helper {
  static double toPixel(double dp, BuildContext context) =>
      dp / MediaQuery.of(context).devicePixelRatio;
}
