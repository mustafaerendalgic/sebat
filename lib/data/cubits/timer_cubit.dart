import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/entity/topic.dart';
import 'package:sebat/data/repo/state/focus_state.dart';

class TimerCubit extends Cubit<FocusState> implements NoteHandler {
  TimerCubit() : super(FocusInitial());

  Timer? _ticker = null;

  void startTimer(String topic) {
    _ticker?.cancel();
    emit(Focusing(elapsedTime: Duration.zero, topic: topic));
    _ticker = Timer.periodic(Duration(seconds: 1), (_) {
      final current = state;
      if (current is Focusing) {
        emit(
          Focusing(
            elapsedTime: current.elapsedTime + Duration(seconds: 1),
            topic: current.topic,
          ),
        );
      }
    });
  }

  void pauseState(String topic) {
    final current = state;
    if (current is Focusing) {
      _ticker?.cancel();
      emit(FocusPaused(elapsedTime: current.elapsedTime, topic: current.topic));
    }
  }

  void resume() {
    final current = state;
    if (current is FocusPaused) {
      emit(Focusing(elapsedTime: current.elapsedTime, topic: current.topic));
      _ticker = Timer.periodic(Duration(seconds: 1), (_) {
        final s = state;
        if (s is Focusing) {
          emit(Focusing(elapsedTime: s.elapsedTime + Duration(seconds: 1), topic: s.topic));
        }
      });
    }
  }

  void completeSession() {
    final current = state;
    _ticker?.cancel();
    switch (current) {
      case Focusing():
        emit(
          FocusCompleted(
            totalFocusedTime: current.elapsedTime,
            topic: current.topic,
          ),
        );
      case FocusPaused():
        emit(
          FocusCompleted(
            totalFocusedTime: current.elapsedTime,
            topic: current.topic,
          ),
        );
      case FocusInitial():
      case FocusCompleted():
        break;
    }
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }

  @override
  Future<void> addNotes(Note note, Topic topic) {
    // TODO: implement addNotes
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNotes(Note note, Topic topic) {
    // TODO: implement deleteNotes
    throw UnimplementedError();
  }

  @override
  Future<void> updateNotes(Note note, Topic topic) {
    // TODO: implement updateNotes
    throw UnimplementedError();
  }
}
