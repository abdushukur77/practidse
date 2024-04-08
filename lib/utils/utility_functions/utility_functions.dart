import 'package:flutter/material.dart';

List<Color> makeColor(List<String> colors) {
  List<Color> madeColors = [];
  for (int i = 0; i < colors.length; i++) {
    Color color = Color(
      int.parse(
        colors[i],
      ),
    );
    madeColors.add(
      color,
    );
  }
  return madeColors;
}
