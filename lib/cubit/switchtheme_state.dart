// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switchtheme_cubit.dart';

@immutable
abstract class SwitchthemeState {}

class SwitchthemeInitial extends SwitchthemeState {
  final bool isDarkThemeOn;
  final ThemeData theme;
  SwitchthemeInitial({
    required this.isDarkThemeOn,
    required this.theme,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SwitchthemeInitial &&
        other.isDarkThemeOn == isDarkThemeOn &&
        other.theme == theme;
  }

  @override
  int get hashCode => isDarkThemeOn.hashCode ^ theme.hashCode;
}
