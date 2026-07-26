import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebat/data/repo/state/focus_state.dart';

class TimerCubit extends Cubit<FocusState> {
  TimerCubit() : super(FocusInitial());
}
