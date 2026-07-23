import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/main_style.dart';

class AiSparklesCircle extends StatelessWidget{
  AiSparklesCircle({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(shape: BoxShape.circle, color: MainStyle.styleType.primary), child: Icon(CupertinoIcons.sparkles, color: Colors.white, size: 28,),
    );
  }
}