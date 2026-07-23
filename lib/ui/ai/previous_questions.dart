import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/data/entity/conversations.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';

class PreviousQuestions extends StatelessWidget {
  final Conversations conversation;
  const PreviousQuestions({required this.conversation, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainStyle.styleType.recommendedQuestionsBackground,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border(left: BorderSide(color: MainStyle.styleType.stroke)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8,
            children: [
              Icon(Icons.history, size: 14,),
              Expanded(
                child: Text(
                  conversation.question,
                  style: TextStyles.captionTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                conversation.date,
                style: TextStyles.captionTextStyle.copyWith(
                  color: MainStyle.styleType.gray,
                ),
              ),
            ],
          ),
          Text(
            conversation.answer,
            style: TextStyles.captionTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
