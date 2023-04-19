import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color_scheme.dart';

class MaterialAppThemes {
  static ThemeData of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkTheme : lightTheme;
  static ThemeData get darkTheme =>
      _getThemeDataFromColorScheme(AppColorScheme.darkColorScheme);

  static ThemeData get lightTheme =>
      _getThemeDataFromColorScheme(AppColorScheme.lightColorScheme);

  static ThemeData _getThemeDataFromColorScheme(ColorScheme colorScheme) {
    ThemeData themeData = colorScheme.brightness == Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light();

    SystemUiOverlayStyle systemOverlayStyle = colorScheme.isDark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return themeData.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      tooltipTheme: TooltipThemeData(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        waitDuration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colorScheme.primaryContainer,
        ),
        textStyle: TextStyle(
            // fontSize: ,
            fontWeight: FontWeight.w500,
            color: colorScheme.onPrimaryContainer),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        surfaceTintColor: colorScheme.background,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.background,
        surfaceTintColor: colorScheme.background,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(
          fontFamily: 'merriweather',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        // elevation: 0,
        surfaceTintColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        backgroundColor: colorScheme.background,
        // systemOverlayStyle: systemOverlayStyle.copyWith(
        //   statusBarColor: colorScheme.background,
        //   statusBarIconBrightness: colorScheme.brightness,
        //   systemNavigationBarContrastEnforced: true,
        // ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: colorScheme.background,
        surfaceTintColor: colorScheme.background,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: colorScheme.background,
      ),
      typography: Typography.material2021().copyWith(
        black: TextTheme().apply(
          fontFamily: 'inter',
          displayColor: colorScheme.onBackground,
        ),
        //         .copyWith(
        //           headlineLarge: const TextStyle(fontFamily: "merriweather"),
        //           headlineMedium: const TextStyle(fontFamily: "merriweather"),
        //           labelLarge: const TextStyle(fontFamily: "merriweather"),
        //         ),
        white: const TextTheme().apply(
          fontFamily: 'merriweather',
          displayColor: colorScheme.onBackground,
        ),
      ),
    );
  }
}
