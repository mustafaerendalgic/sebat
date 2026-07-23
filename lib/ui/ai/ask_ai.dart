import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/common/ai_fab.dart';

class AskAiPage extends StatelessWidget {
  const AskAiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      "Son 7 gün boyunca ne kadar odaklandım?",
      "Aldığım notlar hakkında önerilerin var mı?",
      "Bana bir plan hazırlayabilir misin?",
    ];
    final AppStyle _style = MainStyle.styleType;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: _style.backgroundGradient),
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 16,
                children: [
                  Container(padding: EdgeInsets.only(top: 140), child: Text("Yapay zekaya sor", style: TextStyles.askAiTextStyle,)),
                  AiFab(),
                  ...questions.map((question) => SuggestedQuestionCard(questionText: question))
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SuggestedQuestionCard extends StatelessWidget {
  final String questionText;

  const SuggestedQuestionCard({
    required this.questionText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppStyle style = MainStyle.styleType;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: style.noteBackgroundColor, // Açık pembe zemin rengin
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: style.stroke, // İnce kırmızı/pembe kenarlık
          width: 1,
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          // Sol taraftaki + ikonu
          Icon(
            Icons.add,
            color: style.primary,
            size: 20,
          ),
          // Soru metni
          Expanded(
            child: Text(
              questionText,
              style: TextStyles.bodyTextStyle.copyWith(
                color: style.primary, // Tasarımdaki pembe/kırmızımsı yazı rengi
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}