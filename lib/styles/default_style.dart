import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sebat/styles/app_style.dart';

class DefaultStyle implements AppStyle {
  //-------------------------------- Colors ---------------------------------
  @override
  Color get primary => Color(0xFFEF6351);
  @override
  Color get dropShadow => Color(0xFFFBC3BC);
  @override
  Color get black => Color(0xFF1B2222);
  @override
  Color get noteBackgroundColor => Color(0xFFFBC3BC);
  @override
  Color get gray => Color(0xFF595959);
  @override
  Color get archiveMostFocusedHeader => Color(0xFF67A283);
  @override
  Color get archiveMostFocusedBody => Color(0xFF9AC1AC);
  @override
  List<Color> get archiveTopicsCardColors => [
    Color(0xFFFBC3BC),
    Color(0xFFF2AA7E),
    Color(0xFFFFACFAD),
    Color(0xFFFF3BAD9),
  ];
  @override
  Color get stroke => Color(0xFFFF9386);

  @override
  Color get gradientStartColor => Color(0xFFFFF5F4);
  @override
  Color get gradientMidColor => Color(0xFFFFEEBEF);
  @override
  Color get gradientEndColor => Color(0xFFFBB1C1);
  @override
  LinearGradient get backgroundGradient => LinearGradient(
    begin: Alignment.topLeft,     
    end: Alignment.bottomRight,
    colors: [gradientStartColor, gradientMidColor, gradientEndColor],
    stops: [0.0, 0.68, 1.0],
    
  );

  @override
  Color get fabStartColor => Color(0xFFFFF4F4);
  @override
  Color get fabEndColor => Color(0xFFFFE9E6);
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
