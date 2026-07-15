
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget{
  BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.archivebox))
        ],
      
    );
  }

}