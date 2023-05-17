import 'dart:io';
import 'dart:ui';
import 'package:books_genie/blocs/blocs_global_provider.dart';
import 'package:books_genie/blocs/preferences_cubit/preferences_cubit.dart';
import 'package:books_genie/presentation/screens/storage_option_setup_screen.dart';
import 'package:books_genie/support/services/dependencies_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
//
import 'package:books_genie/presentation/navigation/app_router.dart';
import 'firebase_options.dart';
import 'presentation/themes/material_themes.dart';

bool kIsWindows = Platform.isWindows && !kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await setupHydratedStorage();

  final preferencesCubit = await setupPreferencesCubit();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(preferencesCubit: preferencesCubit),
    ),
  );
}

Future<PreferencesCubit> setupPreferencesCubit() async {
  final preferencesCubit = PreferencesCubit();

  final storageOption = preferencesCubit.state.storageOption;
  if (!kIsWindows) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    if (storageOption != null) {
      await DependenciesService.registerDependenciesForStorage(storageOption);
    }
  } else {
    // Since Firebase does not support Windows, only offline/local storage is available
    await preferencesCubit.setStorageOption(StorageOption.local);
  }
  return preferencesCubit;
}

Future<void> setupHydratedStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.preferencesCubit});

  final PreferencesCubit preferencesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: preferencesCubit,
      child: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          if (state.storagePreferenceConfigured) {
            return BlocsWrapper(
              child: MaterialApp.router(
                title: 'Books Genie',
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                themeMode: state.themeMode,
                locale: state.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                theme: MaterialAppThemes.lightTheme,
                darkTheme: MaterialAppThemes.darkTheme,
                scrollBehavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
              ),
            );
          } else {
            return const StorageOptionSetupScreen();
          }
        },
      ),
    );
  }
}
