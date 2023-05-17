part of 'preferences_cubit.dart';

class PreferencesState {
  final ThemeMode themeMode;
  final Locale locale;
  final StorageOption? storageOption;
  bool get storagePreferenceConfigured => storageOption != null;
  const PreferencesState({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
    this.storageOption,
  });

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode.index,
      'locale': locale.languageCode,
      'storageOption': storageOption?.index,
    };
  }

  factory PreferencesState.fromMap(Map<String, dynamic> map) {
    return PreferencesState(
      themeMode: ThemeMode.values[map.whereKey('themeMode') ?? 0],
      locale: Locale(map.whereKey('locale') ?? 'en'),
      storageOption: map.whereKey('storageOption') != null
          ? StorageOption.values[map.whereKey('storageOption') as int]
          : null,
    );
  }
  @override
  String toString() {
    return '$runtimeType: themeMode: $themeMode, locale: $locale, storage option: $storageOption';
  }

  PreferencesState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    StorageOption? storageOption,
  }) {
    return PreferencesState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      storageOption: storageOption ?? this.storageOption,
    );
  }
}

enum StorageOption {
  local,
  cloud,
  localAndCloud;

  bool get withLocal => this == local || this == localAndCloud;
  bool get isLocal => this == local;
  bool get withCloud => this == cloud || this == localAndCloud;
  bool get isCloud => this == cloud;
}
