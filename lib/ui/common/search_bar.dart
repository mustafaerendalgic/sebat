import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';

class SearchBarSection extends StatelessWidget {
  final String searchHint;
  const SearchBarSection(this.searchHint, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
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
            searchHint,
            style: TextStyles.bodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: MainStyle.styleType.gray
            ),
          ),
          const Spacer(),
          Icon(Icons.sort, color: MainStyle.styleType.gray, size: 24),
        ],
      ),
    );
  }
}