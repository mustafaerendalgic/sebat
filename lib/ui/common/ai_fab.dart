import 'package:flutter/cupertino.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/ai_sparkles_circle.dart';

class AiFab extends StatelessWidget {
  const AiFab({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.only(bottom: 70, left: 16, right: 16),
      decoration: BoxDecoration(
        gradient: MainStyle.styleType.backgroundGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Color(0x22000000),
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        spacing: 16,
        children: [
          AiSparklesCircle(),
          Expanded(
            child: Text(
              "Notların hakkında yapay zekaya bir soru sormak ister misin?",
              style: TextStyles.captionTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
