
import 'package:flutter/cupertino.dart';
import 'package:sebat/data/enum/chips.dart';

class NoteSession with ChangeNotifier{
  NoteSession._internal();
  static final NoteSession instance = NoteSession._internal();
  factory NoteSession() => instance;

  NoteSortChip _currentFilter = NoteSortChip.newest;
  NoteSortChip get currentFilter => _currentFilter;
  void updateCurrentFilter(NoteSortChip filter){
    _currentFilter = filter;
    notifyListeners();
  }

}