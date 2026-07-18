import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Text(
        "Hesap sayfası",
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
