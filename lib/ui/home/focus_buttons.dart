import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sebat/data/cubits/timer_cubit.dart';
import 'package:sebat/styles/main_style.dart';

class FocusButton extends StatelessWidget {
  final IconData icon;
  final Function(String) callback;
  FocusButton({required this.icon, required this.callback, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 72,
      //padding: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MainStyle.styleType.primary,
      ),
      child: IconButton(
        onPressed: () {
          callback("topic");
        },
        icon: Icon(icon, color: Colors.white, size: 42),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  final TimerCubit timerCubit;
  PlayButton({required this.timerCubit, super.key});
  @override
  Widget build(BuildContext context) {
    return FocusButton(
      icon: Icons.play_arrow_rounded,
      callback: (String mesaj) {
        timerCubit.startTimer(mesaj);
      },
    );
  }
}

class FocusingButtons extends StatelessWidget {
  final TimerCubit timerCubit;
  FocusingButtons({required this.timerCubit, super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FocusButton(
          icon: Icons.stop,
          callback: (String topic) {
            timerCubit.completeSession();
          },
        ),
        FocusButton(
          icon: Icons.pause,
          callback: (String topic) {
            timerCubit.pauseState(topic);
          },
        ),
      ],
    );
  }
}

class PauseButtons extends StatelessWidget {
  final TimerCubit timerCubit;
  PauseButtons({required this.timerCubit, super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FocusButton(
          icon: Icons.stop,
          callback: (String topic) {
            timerCubit.completeSession();
          },
        ),
        FocusButton(
          icon: Icons.play_arrow_rounded,
          callback: (String topic) {
            timerCubit.resume();
          },
        ),
      ],
    );
  }
}