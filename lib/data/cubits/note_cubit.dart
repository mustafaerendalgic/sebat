import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/entity/topic.dart';
import 'package:sebat/data/repo/note_repo.dart';
import 'package:sebat/data/repo/state/notes_state.dart';

class NoteCubit extends Cubit<NotesState> implements NoteFilter {
  final NoteRepo _noteRepo;
  NoteCubit({NoteRepo? noteRepo})
    : _noteRepo = noteRepo ?? NoteRepo.instance,
      super(NotesInitial()) {
    listenToNotes(_noteRepo.currentTopic);
  }

  Topic get topic => _noteRepo.currentTopic;
  StreamSubscription<List<Note>>? _streamSubscription;

  Future<void> listenToNotes(Topic newTopic) async {
    if (state is NotesLoaded &&
        (state as NotesLoaded).topic.topic.toLowerCase() ==
            topic.topic.toLowerCase())
      return;
    emit(NotesLoading(newTopic));
    await _streamSubscription?.cancel();
    _streamSubscription = _noteRepo.getNotes(newTopic).listen((noteList) {
      emit(NotesLoaded(notes: noteList, topic: newTopic));
    }, onError: (e) => emit(NotesError(e.toString())));
  }

  Future<void> changeTopic(Topic topic) async {
    _noteRepo.updateTopic(topic);
    listenToNotes(topic);
  }

  @override
  void byDate(DateTime date) {
    // TODO: implement byDate
  }

  @override
  void newest() {
    // TODO: implement newest
  }

  @override
  void oldest() {
    // TODO: implement oldest
  }

  @override
  void search(String message) {
    // TODO: implement search
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
