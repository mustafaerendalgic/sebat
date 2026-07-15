import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/ui/top_bar.dart';

void main() {
  runApp(const MyApp());
}

enum Tabs { home, archive, ai, account }

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    final style = MainStyle.styleType;
    return MaterialApp(
      home: CupertinoTabScaffold(tabBar: 
        CupertinoTabBar(
          items: [
            ...Tabs.values.map((tab) {
              return switch(tab){
                Tabs.home => BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                Tabs.archive => BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                Tabs.ai => BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
                Tabs.account => BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
              };
            })
            ],
        ), 
      tabBuilder: (BuildContext context, int index){
        return Cupertino
      }),
    );
  }

}