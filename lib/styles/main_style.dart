
import 'package:flutter/material.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/default_style.dart';
import 'package:sebat/styles/green_style.dart';

abstract class MainStyle with ChangeNotifier{

  static StyleType _styleType = StyleType.pink;

  static AppStyle _pinkStyle = DefaultStyle();
  static AppStyle _greenStyle = GreenStyle();

  static AppStyle get styleType => switch(_styleType){
    StyleType.pink => _pinkStyle,
    StyleType.green => _greenStyle,
  };

  void setStyleType(StyleType styleType){
    _styleType = styleType;
    notifyListeners();
  }

}

enum StyleType { pink, green }