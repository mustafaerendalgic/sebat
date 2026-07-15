
import 'package:flutter/material.dart';
import 'package:sebat/styles/main_style.dart';

abstract class TextStyles{

  static final Color _textColor = MainStyle.styleType.textColor;

   //-------------------------------- Text Styles ---------------------------------

  static final TextStyle captionTextStyle = TextStyle(
    color: _textColor,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'unna',
  );

  static final TextStyle boldCaptionTextStyle = TextStyle(
    color: _textColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'unna',
  );

  static final TextStyle bodyTextStyle = TextStyle(
    color: _textColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'unna',
  );

  static final TextStyle boldBodyTextStyle = TextStyle(
    color: _textColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'unna',
  );

  static final TextStyle boldTitleTextStyle = TextStyle(
    color: _textColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'unna',
  );

  static final TextStyle titleTextStyle = TextStyle(
    color: _textColor,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'unna',
  );

  static final TextStyle appTitleTextStyle = TextStyle(
    color: _textColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'unna',
  );

  static final TextStyle askAiTextStyle = TextStyle(
    color: _textColor,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'unna',
  );

  static final TextStyle timerTextStyle = TextStyle(
    color: _textColor,
    fontSize: 64,
    fontWeight: FontWeight.normal,
    fontFamily: 'rethink',
  );
}