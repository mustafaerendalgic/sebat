import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/entity/topic.dart';
import 'package:sebat/data/enum/note_sort.dart';

sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {
  Topic topic;
  NotesLoading(this.topic);
}

class NotesLoaded extends NotesState {
  final List<Note> notes;
  final Topic topic;
  final NoteSortChip filter;
  NotesLoaded({
    required this.notes,
    required this.topic,
    this.filter = NoteSortChip.newest,
  });
}

class NotesError extends NotesState {
  String error;
  NotesError(this.error);
}

abstract class NoteFilter {
  void newest();
  void oldest();
  void byDate(DateTime date);
  void search(String message);
}
