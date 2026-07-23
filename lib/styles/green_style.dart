import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sebat/styles/app_style.dart';

class GreenStyle implements AppStyle {
  GreenStyle._internal();
  static final GreenStyle instance = GreenStyle._internal();
  factory GreenStyle() => instance;

  //-------------------------------- Colors ---------------------------------

  @override
  Color get primary => Color(0xFF67A283);
  @override
  Color get dropShadow => Color(0xFF67A283);
  @override
  Color get black => Color(0xFF1B2222);
  @override
  Color get noteBackgroundColor => Color(0xFF9AC1AC);
  @override
  Color get gray => Color(0xFF595959);
  @override
  Color get archiveMostFocusedHeader => Color(0xFFEF6351);
  @override
  Color get archiveMostFocusedBody => Color(0xFFFBC3BC);
  @override
  List<Color> get archiveTopicsCardColors => [
    Color(0xFF9AC1AC),
    Color(0xFF67A283),
    Color(0xFF3B8D7E),
    Color(0xFF2C6B5F),
  ];
  @override
  Color get stroke => Color(0xFF67A283);

  @override
  Color get gradientStartColor => Color(0xFFF5FFF4);
  @override
  Color get gradientMidColor => Color(0xFFE9FFE6);
  @override
  Color get gradientEndColor => Color(0xFFD1FBD1);
  @override
  LinearGradient get backgroundGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStartColor, gradientMidColor, gradientEndColor],
    stops: [0.0, 0.68, 1.0],
    transform: GradientRotation(0.97),
  );

  @override
  Color get fabStartColor => Color(0xFFF4FFF4);
  @override
  Color get fabEndColor => Color(0xFFE6FFE6);
  @override
  LinearGradient get fabGradient => LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [fabStartColor, fabEndColor],
    stops: [0.24, 0.85],
    transform: GradientRotation(-126 * math.pi / 180),
  );

@override
  LinearGradient get mostFocusedGradient => LinearGradient(colors: [Color(0xffFFD9D4), Color(0xffFFE3E0)], begin: Alignment.topCenter, end: AlignmentGeometry.bottomCenter);

  @override
  Color get mostFocusedChips => Color(0xfffbc3bc);

  @override
  List<Color> get topicCardBackgrounds => [Color(0xffFBC3BC), Color(0xffF3BAD9), Color(0xffFACFAD)];

}
