import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Text(
        "Arşiv sayfası",
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
