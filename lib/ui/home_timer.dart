import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';

class HomeTimer extends StatelessWidget {
  const HomeTimer({super.key});
  @override
  Widget build(BuildContext context) {
    final style = MainStyle.styleType;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 62, top: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    spacing: 12,
                    children: [
                      Text(
                        "Türkiye'de Geri Kalmışlığın Tarihi",
                        style: TextStyles.titleTextStyle,
                      ),
                      Text("22 saat", style: TextStyles.bodyTextStyle),
                    ],
                  ),
                  Container(
                    height: 290,
                    width: 290,
                    decoration: BoxDecoration(
                      border: Border.all(color: style.primary, width: 2),
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: style.dropShadow,
                          blurRadius: 19.1,
                          spreadRadius: 0,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text("00:00", style: TextStyles.timerTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: style.primary,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                              right: 4,
                              left: 8,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              CupertinoIcons.play_fill,
                              color: style.primary,
                              size: 24,
                            ),
                          ),
                          Text(
                            "Başla",
                            style: TextStyles.titleTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 8,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: style.fabGradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: TextField(
                            cursorColor: style.primary,
                            style: TextStyles.bodyTextStyle,
                            decoration: InputDecoration(
                              focusColor: style.primary,
                              hoverColor: style.primary,
                              fillColor: style.primary,
                              border: InputBorder.none,
                              labelStyle: TextStyles.bodyTextStyle,
                              labelText: "Bir not almak ister misin?",
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: style.primary,
                          ),
                          child: Icon(
                            CupertinoIcons.mic_fill,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: style.primary,
                          ),
                          child: Icon(
                            CupertinoIcons.sparkles,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
