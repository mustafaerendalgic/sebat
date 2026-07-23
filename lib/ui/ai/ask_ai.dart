import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/data/entity/conversations.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/ai/previous_questions.dart';
import 'package:sebat/ui/ai/suggested_questions.dart';
import 'package:sebat/ui/common/ai_fab.dart';
import 'package:lottie/lottie.dart';

class AskAiPage extends StatefulWidget {
  const AskAiPage({super.key});

  @override
  State<AskAiPage> createState() {
    return AskAiPageState();
  }
}

class AskAiPageState extends State<AskAiPage> {
  late final AnimationController _lottieController;

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      "Son 7 gün boyunca ne kadar odaklandım?",
      "Aldığım notlar hakkında önerilerin var mı?",
      "Bana bir plan hazırlayabilir misin?",
    ];
    final List<Conversations> conversations = [
      Conversations(
        "Mürtezika kelimesinin internetteki anlamı ile İsmail Cem’in Türkiye’de Geri Kalmışlığın Tarihi kitabındaki anlamı uyuşmuyor",
        "Mürtezika kelimesi Osmanlı’da bakıma muhtaç, ekonomiye katkısı olmayan ve devletin ilgilendiği kişiler için kullanılır... Devamını gör",
        "17 Nisan 2026",
      ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 140),
                        child: Text(
                          "Yapay \n zekaya sor",
                          style: TextStyles.askAiTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Lottie.asset('assets/ask_ai.json', repeat: true),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: AiFab(margin: false),
                  ),
                  ...questions.map(
                    (question) => SuggestedQuestionCard(questionText: question),
                  ),
                  Text("Geçmiş Soruların", style: TextStyles.titleTextStyle),
                  ...conversations.map((conversation) {
                    return PreviousQuestions(conversation: conversation);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
