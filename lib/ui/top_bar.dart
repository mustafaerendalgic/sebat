
import 'package:flutter/material.dart';
import 'package:sebat/styles/text_styles.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,        
        children: [
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          Text("sebat", style: TextStyles.appTitleTextStyle),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
    );
  }
}