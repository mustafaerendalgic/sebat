import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/repo/note_handler.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';

class HomeNotes extends StatelessWidget {
  const HomeNotes({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(gradient: MainStyle.styleType.backgroundGradient),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 16,
              children: [
                SearchBarSection(),
                Text(
                  NoteHandler.instance.topic,
                  style: TextStyles.titleTextStyle,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Note item = NoteHandler.instance.notes[index];
              return NoteCards(note: item);
            }),
          ),
        ],
      ),
    );
  }
}

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            CupertinoIcons.search,
            color: MainStyle.styleType.gray,
            size: 28,
          ),
          Text(
            "Notların arasında ara",
            style: TextStyles.bodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Icon(Icons.filter, color: MainStyle.styleType.gray, size: 24),
        ],
      ),
    );
  }
}

class NoteCards extends StatelessWidget {
  final Note note;
  NoteCards({required this.note, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
              Icon(CupertinoIcons.forward, color: MainStyle.styleType.black),
            ],
          ),
        ],
      ),
    );
  }
}
