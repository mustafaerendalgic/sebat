import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/enum/note_sort.dart';

sealed class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;
  final String topic;
  final NoteSortChip filter;
  NotesLoaded({
    required this.notes,
    required this.topic,
    this.filter = NoteSortChip.newest,
  });
}

class NotesError extends NotesState {}

