import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/entity/topic.dart';

sealed class FocusState {}

class FocusInitial extends FocusState {
  final Duration elapsedTime;
  FocusInitial({this.elapsedTime = Duration.zero});
}

class Focusing extends FocusState {
  final Duration elapsedTime;
  final String topic;
  Focusing({required this.elapsedTime, required this.topic});
}

class FocusPaused extends FocusState {
  final Duration elapsedTime;
  final String topic;
  FocusPaused({required this.elapsedTime, required this.topic});
}

class FocusCompleted extends FocusState {
  final Duration totalFocusedTime;
  final String topic;
  FocusCompleted({required this.totalFocusedTime, required this.topic});
}

abstract class NoteHandler {
  Future<void> addNotes(Note note, Topic topic);
  Future<void> deleteNotes(Note note, Topic topic);
  Future<void> updateNotes(Note note, Topic topic);
}


