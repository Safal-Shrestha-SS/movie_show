import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_show/theme/theme.dart';

part 'switchtheme_state.dart';

class SwitchthemeCubit extends Cubit<SwitchthemeState> {
  SwitchthemeCubit()
      : super(SwitchthemeInitial(isDarkThemeOn: false, theme: lightTheme));

  void switchTheme() async {
    var theme = state as SwitchthemeInitial;
    var toggle = !theme.isDarkThemeOn;
    emit(SwitchthemeInitial(
        isDarkThemeOn: toggle, theme: toggle ? darkTheme : lightTheme));
  }
}
