import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/ui/account/account.dart';
import 'package:sebat/ui/archives/archives.dart';
import 'package:sebat/ui/ai/ask_ai.dart';
import 'package:sebat/ui/home/home.dart';
import 'package:sebat/ui/common/top_bar.dart';

void main() {
  debugPaintBaselinesEnabled = false;
  runApp(const MyApp());
}

enum Tabs { home, archive, ai, account }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final style = MainStyle.styleType;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(gradient: style.backgroundGradient),
        child: CupertinoTabScaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.transparent,
            activeColor: style.primary,
            inactiveColor: style.black,
            items: Tabs.values.map((tab) {
              return switch (tab) {
                Tabs.home => const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: "Home",
                ),
                Tabs.archive => const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.archivebox),
                  label: "Archive",
                ),
                Tabs.ai => const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.sparkles),
                  label: "AI",
                ),
                Tabs.account => const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: "Account",
                ),
              };
            }).toList(),
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (context) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      TopBar(),
                      Expanded(
                        child: switch (index) {
                          0 => const HomePage(),
                          1 => const ArchivesPage(),
                          2 => const AskAiPage(),
                          3 => const AccountPage(),
                          _ => const HomePage(),
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
