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

List<String> cardTypes = [
  "UZCARD",
  "HUMO",
  "VISA",
  "MASTERCARD",
  "UNION PAY",
];

List<String> madeColorList(int index) {
  List<String> colors = [];
  for (int i = 0; i < gradientColors[index].length; i++) {
    colors.add(
      gradientColors[index][i].value.toString(),
    );
  }
  return colors;
}

List<List<Color>> gradientColors = [
  [
    const Color(0xFF23F2E6),
    const Color(0xFF2ACB4E),
    const Color(0xFFC529FC),
  ],
  [
    const Color(0xFFFFD951),
    const Color(0xFFEC201B),
  ],
  [
    const Color(0xFF006BFF),
    const Color(0xFF343AD7),
    const Color(0xFFF43DF7),
  ],
  [
    const Color(0xFF4EDFFF),
    const Color(0xFFFFD90F),
    const Color(0xFF930BFD),
  ],
  [
    const Color(0xFF0038FF),
    const Color(0xFF00E0FF),
    const Color(0xFF1FAEFF),
  ],
  [
    const Color(0xFF0A7CCF),
    const Color(0xFF22FF53),
    const Color(0xFF22FF95),
  ],
  [
    const Color(0xFF4D20FF),
    const Color(0xFFE46289),
    const Color(0xFFFF5789),
  ],
  [
    const Color(0xFF00FFC2),
    const Color(0xFF1CF2CC),
    const Color(0xFF2F9FF1),
  ],
  [
    const Color(0xFF001973),
    const Color(0xFF00AAB8),
    const Color(0xFF00E0FF),
    const Color(0xFF423FC3),
  ],
  [
    const Color(0xFFFF29A8),
    const Color(0xFFFF7A00),
    const Color(0xFFFFD481),
  ],
  [
    const Color(0xFFFFDCC5),
    const Color(0xFFB515D0),
    const Color(0xFFB515D0).withOpacity(
      0.8,
    ),
  ],
  [
    const Color(0xFF4EDFFF),
    const Color(0xFF6A24FE),
    const Color(0xFF929CF3),
  ],
  [
    const Color(0xFF3F00B9),
    const Color(0xFFE507B6),
    const Color(0xFFFF8993),
  ],
  [
    const Color(0xFF00EAFF),
    const Color(0xFF4E29E4),
    const Color(0xFF6A40D3),
    const Color(0xFF9AAAFF),
  ],
  [
    const Color(0xFF0466EE),
    const Color(0xFF35DDA1),
    const Color(0xFF46B835),
  ],
  [
    const Color(0xFF0032EF),
    const Color(0xFF1AC7FF),
    const Color(0xFF339DFF),
    const Color(0xFFFF16F0),
  ],
  [
    const Color(0xFF9020FF),
    const Color(0xFFEB20B2),
    const Color(0xFFFF8B20),
  ],
  [
    const Color(0xFF20E4FF),
    const Color(0xFF4D20FF),
    const Color(0xFFFFD90F),
  ],
  [
    const Color(0xFF00A3FF),
    const Color(0xFFFFBE40),
    const Color(0xFFFFF065),
  ],
  [
    const Color(0xFFFF22F6),
    const Color(0xFFFF9900),
    const Color(0xFF00A3FF),
  ],
];
