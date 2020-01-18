import 'package:flutter/material.dart';
import '../helper/palette.dart';

class Overlays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: Palette.bgToZero(
                      Alignment.centerLeft, Alignment.centerRight),
//                  backgroundBlendMode: BlendMode.luminosity,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    gradient: Palette.bgToZero(
                        Alignment.centerRight, Alignment.centerLeft)),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    gradient: Palette.bgToZero(
                        Alignment.topCenter, Alignment.bottomCenter)),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    gradient: Palette.bgToZero(
                        Alignment.bottomCenter, Alignment.topCenter)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
