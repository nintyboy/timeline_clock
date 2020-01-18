import 'package:flutter/material.dart';
import '../helper/functions.dart';
import '../helper/palette.dart';

class timeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Palette.orange,
      width: MediaQuery.of(context).size.width,
      height: Helper.toPixel(5.0, context),
    ));
  }
}
