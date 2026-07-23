import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';

class SuggestedQuestionCard extends StatelessWidget {
  final String questionText;

  const SuggestedQuestionCard({required this.questionText, super.key});

  @override
  Widget build(BuildContext context) {
    final AppStyle style = MainStyle.styleType;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: style.recommendedQuestionsBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: style.stroke, width: 1),
      ),
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.add, color: style.primary, size: 20),
          Expanded(
            child: Text(
              questionText,
              style: TextStyles.bodyTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}