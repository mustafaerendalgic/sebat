import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppStyle {
  Color get primary;
  Color get dropShadow;
  Color get black;
  Color get noteBackgroundColor;
  Color get gray;
  Color get archiveMostFocusedHeader;
  Color get archiveMostFocusedBody;
  List<Color> get archiveTopicsCardColors;
  Color get stroke;
  Color get gradientStartColor;
  Color get gradientMidColor;
  Color get gradientEndColor;
  LinearGradient get backgroundGradient;
  Color get fabStartColor;
  Color get fabEndColor;
  LinearGradient get fabGradient;
  LinearGradient get mostFocusedGradient;
  Color get mostFocusedChips;
  List<Color> get topicCardBackgrounds;
}
