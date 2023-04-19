import 'package:books_genie/support/services/dependencies_service.dart';
import 'package:books_genie/support/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'preferences_state.dart';

class PreferencesCubit extends HydratedCubit<PreferencesState> {
  PreferencesCubit() : super(const PreferencesState());

  @override
  PreferencesState? fromJson(Map<String, dynamic> json) {
    return PreferencesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(PreferencesState state) {
    return state.toMap();
  }

  void setThemeModePreference(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void setLocalePreference(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  Future<void> setStorageOption(StorageOption option) async {
    await DependenciesService.registerDependenciesForStorage(option);

    emit(state.copyWith(storageOption: option));
  }
}
