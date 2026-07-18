import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/home_notes.dart';
import 'package:sebat/ui/home_timer.dart';

class HomePage extends StatelessWidget {
  static final style = MainStyle.styleType;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        HomeTimer(),
        HomeNotes(),
      ],
    );
  }
}
