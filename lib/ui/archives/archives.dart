import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/data/entity/topic.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/common/ai_fab.dart';
import 'package:sebat/ui/common/search_bar.dart';

enum ArchiveSortChips { byLatest, byFocusTime }

class ArchivesPage extends StatefulWidget {
  const ArchivesPage({super.key});

  @override
  State<StatefulWidget> createState() => ArchivesState();
}

class ArchivesState extends State<ArchivesPage> {
  AppStyle _style = MainStyle.styleType;
  ArchiveSortChips _sortType = ArchiveSortChips.byLatest;
  @override
  Widget build(BuildContext context) {
    List<Topic> topicList = [
      Topic(
        "Türkiye'de Geri Kalmışlığın Tarihi",
        "Mürtezika kelimesi Osmanlı’da bakıma muhtaç, ekonomiye katkısı olmayan ve devletin ilgilendiği kişiler için kullanılır.",
        "22 saat",
        "En son 2 Mart",
        16,
      ),
      Topic(
        "Sosyal Hayvan",
        "Mürtezika kelimesi Osmanlı’da bakıma muhtaç, ekonomiye katkısı olmayan ve devletin ilgilendiği kişiler için kullanılır.",
        "17 saat",
        "En son 2 Nisan",
        28,
      ),
    ];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: _style.backgroundGradient),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                      left: 16,
                      top: 16,
                    ),
                    child: Text(
                      "Sık Odaklanılan Başlıklar",
                      style: TextStyles.titleTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CarouselView.builder(
                        itemCount: topicList.length,
                        itemExtent: 272,
                        shrinkExtent: 272,
                        itemBuilder: (context, index) {
                          final item = topicList[index];
                          return MostFocusedCards(topic: item);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        SearchBarSection("Başlıklar arasında ara"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 12,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.arrow_swap),
                                iconSize: 21,
                              ),
                              ...ArchiveSortChips.values.map((by) {
                                final Color color = by == _sortType
                                    ? Colors.white
                                    : _style.gray;
                                return ChoiceChip(
                                  label: switch (by) {
                                    ArchiveSortChips.byLatest => Text(
                                      "En son odaklanılan",
                                      style: TextStyles.bodyTextStyle.copyWith(
                                        color: color,
                                      ),
                                    ),
                                    ArchiveSortChips.byFocusTime => Text(
                                      "Odaklanma süresi",
                                      style: TextStyles.bodyTextStyle.copyWith(
                                        color: color,
                                      ),
                                    ),
                                  },
                                  checkmarkColor: color,
                                  selected: _sortType == by,
                                  selectedColor: _style.primary,
                                  visualDensity: VisualDensity.compact,
                                  onSelected: (bool selected) {
                                    if (selected) {
                                      setState(() {
                                        _sortType = by;
                                      });
                                    }
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: topicList.length,
                (context, index) {
                  return TopicCards(topicList[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AiFab(margin: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class TopicCards extends StatelessWidget {
  final Topic _topic;
  const TopicCards(this._topic, {super.key});
  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    final backgroundColor =
        MainStyle.styleType.topicCardBackgrounds[_random.nextInt(
          MainStyle.styleType.topicCardBackgrounds.length,
        )];
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16),
      child: Row(
        spacing: 8,
        children: [
          Container(
            alignment: AlignmentGeometry.center,
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Text(
              _topic.lastFocused.split(" ").sublist(2).join(" "),
              style: TextStyles.bodyTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _topic.topic,
                      style: TextStyles.bodyTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      _topic.lastNote,
                      style: TextStyles.captionTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MostFocusedCards extends StatefulWidget {
  final Topic topic;
  const MostFocusedCards({required this.topic, super.key});
  @override
  State<StatefulWidget> createState() {
    return MostFocusedCardsState();
  }
}

class MostFocusedCardsState extends State<MostFocusedCards> {
  @override
  Widget build(BuildContext context) {
    final Topic topic = this.widget.topic;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: MainStyle.styleType.mostFocusedGradient,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [
            Text(
              topic.topic,
              style: TextStyles.bodyTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              topic.lastNote,
              style: TextStyles.captionTextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...Chips.values.map((e) {
                  return Chip(
                    label: Text(switch (e) {
                      Chips.time => topic.focusTime,
                      Chips.lastWhen => topic.lastFocused,
                      Chips.noteNumber => topic.noteNumber.toString() + " Not",
                    }, style: TextStyles.captionTextStyle),
                    backgroundColor: MainStyle.styleType.mostFocusedChips,
                    avatar: e == Chips.time
                        ? Icon(
                            Icons.history,
                            size: 14,
                            color: MainStyle.styleType.black,
                          )
                        : null,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    side: BorderSide.none,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum Chips { time, lastWhen, noteNumber }
