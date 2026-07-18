import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskAiPage extends StatelessWidget {
  const AskAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(height: 400, width: 400, child: Text("Ai sayfası",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black, 
          ))),
    );
  }
}
