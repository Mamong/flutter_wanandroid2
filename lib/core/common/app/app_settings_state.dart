part of 'app_settings_provider.dart';


class AppSettingsState extends Equatable {
  const AppSettingsState({required this.language, required this.themeColor});

  final String language;
  final Color themeColor;

  AppSettingsState copyWith({String? language, Color? themeColor}){
    return AppSettingsState(
        language: language ?? this.language,
        themeColor: themeColor ?? this.themeColor
    );
}

  @override
  List<Object?> get props => [language,themeColor];
}