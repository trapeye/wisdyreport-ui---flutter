import 'dart:ui';

import 'package:flutter/material.dart';

const Color deepBlue = Color(0xFF222260);
const Color pinkPurple = Color(0xDDF0D9E1);
const double sizeIcon = 24.0;
const Color grey = Color(0xFFE8E8F3);

class Data {
  static const int studentNo = 2;
  static const int score = 22;
  static const int totalScore = 30;
  static const int indexTest = 2;
  static const int amountTest = 24;
}

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {@required this.onPressed,
      this.fillColor,
      this.splashColor,
      this.text,
      this.textColor,
      this.paddingVertical,
      this.paddingHorizontal});
  final GestureTapCallback onPressed;
  final Color fillColor;
  final Color splashColor;
  final String text;
  final Color textColor;
  final double paddingVertical;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      fillColor: fillColor,
      splashColor: splashColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: paddingHorizontal),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              text,
              maxLines: 1,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
