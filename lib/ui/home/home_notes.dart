import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/enum/chips.dart';
import 'package:sebat/data/repo/note_handler.dart';
import 'package:sebat/data/repo/note_session.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/common/ai_sparkles_circle.dart';
import 'package:sebat/ui/common/ai_fab.dart';
import 'package:sebat/ui/common/search_bar.dart';

class HomeNotes extends StatelessWidget {
  final VoidCallback? onScrollTop;

  const HomeNotes(this.onScrollTop, {super.key});
  @override
  Widget build(BuildContext context) {
    final AppStyle style = MainStyle.styleType;
    final NoteSession noteSession = NoteSession.instance;
    final NoteHandler noteHandler = NoteHandler.instance;
    const int _overscrollThreshold = 500;
    double _accumulatedScrolling = 0;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16, bottom: 70, left: 16, right: 16),
        decoration: BoxDecoration(gradient: style.backgroundGradient),
        child: NotificationListener<OverscrollNotification>(
          onNotification: (notification) {
            if (notification is OverscrollNotification &&
                notification.overscroll < 0 &&
                notification.dragDetails != null) {
              _accumulatedScrolling += notification.overscroll.abs();
              if (_accumulatedScrolling > _overscrollThreshold) {
                _accumulatedScrolling = 0;
                onScrollTop?.call();
              }
              if (notification is ScrollEndNotification) {
                _accumulatedScrolling = 0;
              }
              return true;
            }
            return false;
          },
          child: CustomScrollView(
            physics: PageScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBarSection("Notların arasında ara"),
                    Text(
                      NoteHandler.instance.topic,
                      style: TextStyles.titleTextStyle,
                    ),
                    ListenableBuilder(
                      listenable: NoteSession.instance,
                      builder: (builder, context) {
                        return Row(
                          spacing: 12,
                          children: [
                            Icon(Icons.swap_vert, size: 21, color: style.gray),
                            ...NoteSortChip.values.map((filter) {
                              final bool isSelected =
                                  filter == noteSession.currentFilter;
                              final Color color = isSelected
                                  ? Colors.white
                                  : style.gray;
                              return ChoiceChip(
                                selected: isSelected,
                                checkmarkColor: color,
                                backgroundColor: Colors.transparent,
                                selectedColor: style.primary,
                                label: Text(
                                  switch (filter) {
                                    NoteSortChip.newest => "En yeni",
                                    NoteSortChip.oldest => "En eski",
                                  },
                                  style: TextStyles.bodyTextStyle.copyWith(
                                    color: color,
                                  ),
                                ),
                                onSelected: (value) {
                                  if (value) {
                                    noteSession.updateCurrentFilter(filter);
                                  }
                                },
                              );
                            }),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: noteHandler.notes.length,
                  (context, index) {
                    final Note item = noteHandler.notes[index];
                    if (index != 0 &&
                        noteHandler.notes[index - 1].date.split(" ")[1] !=
                            noteHandler.notes[index].date.split(" ")[1]) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 24,
                        children: [
                          Text(
                            noteHandler.notes[index].date
                                .split(" ")
                                .sublist(1)
                                .join(" "),
                            style: TextStyles.titleTextStyle,
                          ),
                          NoteCards(note: item),
                        ],
                      );
                    }
                    return NoteCards(note: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AiFab(margin: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NoteCards extends StatelessWidget {
  final Note note;
  NoteCards({required this.note, super.key});
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border(
                  left: BorderSide(
                    color: MainStyle.styleType.primary,
                    width: 3,
                  ),
                ),
                color: MainStyle.styleType.noteBackgroundColor,
              ),
              child: Column(
                spacing: 4,
                children: [
                  Text(note.body, style: TextStyles.bodyTextStyle),
                  Row(
                    spacing: 10,
                    children: [
                      Spacer(),
                      Text(note.date, style: TextStyles.captionTextStyle),
                      Icon(
                        CupertinoIcons.forward,
                        color: MainStyle.styleType.black,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
