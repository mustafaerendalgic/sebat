import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebat/data/cubits/timer_cubit.dart';
import 'package:sebat/data/repo/state/focus_state.dart';
import 'package:sebat/styles/app_style.dart';
import 'package:sebat/styles/main_style.dart';
import 'package:sebat/styles/text_styles.dart';
import 'package:sebat/ui/common/format_duration.dart';
import 'package:sebat/ui/home/focus_buttons.dart';

class HomeTimer extends StatelessWidget {
  const HomeTimer({super.key});
  @override
  Widget build(BuildContext context) {
    final style = MainStyle.styleType;
    final TimerCubit timerCubit = TimerCubit();
    return Scaffold(
      body: BlocBuilder<TimerCubit, FocusState>(
        bloc: timerCubit,
        builder: (BuildContext context, FocusState state) {
          Duration elapsed = switch (state) {
            Focusing() => state.elapsedTime,
            FocusInitial() => state.elapsedTime,
            FocusPaused() => state.elapsedTime,
            FocusCompleted() => Duration.zero,
          };
          return Container(
            decoration: BoxDecoration(gradient: style.backgroundGradient),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 62, top: 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 32,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          spacing: 12,
                          children: [
                            Text(
                              "Türkiye'de Geri Kalmışlığın Tarihi",
                              style: TextStyles.titleTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text("22 saat", style: TextStyles.bodyTextStyle),
                          ],
                        ),
                        Container(
                          height: 290,
                          width: 290,
                          decoration: BoxDecoration(
                            border: Border.all(color: style.primary, width: 2),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: style.dropShadow,
                                blurRadius: 19.1,
                                spreadRadius: 0,
                                blurStyle: BlurStyle.outer,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              formatDuration(elapsed),
                              style: TextStyles.timerTextStyle,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: switch (state) {
                            FocusInitial() => PlayButton(
                              timerCubit: timerCubit,
                            ),
                            Focusing() => FocusingButtons(
                              timerCubit: timerCubit,
                            ),
                            FocusPaused() => PauseButtons(
                              timerCubit: timerCubit,
                            ),
                            FocusCompleted() => PlayButton(
                              timerCubit: timerCubit,
                            ),
                          },
                        ),
                      ],
                    ),
                    Column(
                      spacing: 8,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            gradient: style.fabGradient,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: TextField(
                                  cursorColor: style.primary,
                                  style: TextStyles.bodyTextStyle,
                                  decoration: InputDecoration(
                                    focusColor: style.primary,
                                    hoverColor: style.primary,
                                    fillColor: style.primary,
                                    border: InputBorder.none,
                                    labelStyle: TextStyles.bodyTextStyle,
                                    labelText: "Bir not almak ister misin?",
                                  ),
                                ),
                              ),
                              Container(
                                height: 48,
                                width: 48,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: style.primary,
                                ),
                                child: Icon(
                                  CupertinoIcons.mic_fill,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 48,
                                width: 48,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: style.primary,
                                ),
                                child: Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}