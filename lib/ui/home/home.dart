import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/ui/ai/ask_ai.dart';
import 'package:sebat/ui/home/home_notes.dart';
import 'package:sebat/ui/home/home_timer.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController();
  bool _isNavigating = false;

  void _goBack(){
    if(_isNavigating) return;
    final page = _pageController.page;
    if(page != null && page > 0){
      _isNavigating = true;
      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.decelerate).then((_) => _isNavigating = false);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: [
        HomeTimer(),
        HomeNotes(_goBack),
        AskAiPage(),
      ],
    );
  }
}
