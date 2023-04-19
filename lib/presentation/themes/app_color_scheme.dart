import 'package:flutter/material.dart';

class AppColorScheme {
  static final ColorScheme darkColorScheme = ColorScheme.dark(
    primary: const Color(0xFF6E9EFE),
    tertiary: const Color(0xFFD8C38B),
    onPrimary: const Color(0xFF0c1110),
    secondary: const Color(0xFFC17CFF),
    onSecondary: const Color(0xFF16130e),
    primaryContainer: const Color(0xFF374f7f),
    onPrimaryContainer: const Color(0xfff3f9f8),
    secondaryContainer: const Color(0xFF744a99).withOpacity(.5),
    onSecondaryContainer: const Color(0xFF413a2a),
    error: Colors.redAccent.shade200,
    onError: const Color(0xFFfff1f3),
    background: const Color(0xFF212f4c),
    onBackground: const Color(0xFFd4e2ff),
    surface: const Color(0xFF272f33),
    onSurface: const Color(0xFFe9eaeb),
  );
  // Light //
  static final ColorScheme lightColorScheme = ColorScheme.light(
    primary: const Color(0xFF6E9EFE),
    onPrimary: const Color(0xFF1b2625),
    primaryContainer: const Color(0xFFf1f5ff),
    onPrimaryContainer: const Color(0xFF3a254c).withOpacity(.7),
    secondary: const Color(0xFFC17CFF),
    onSecondary: const Color(0xFF2b271c),
    secondaryContainer: const Color(0xFFe6cbff),
    onSecondaryContainer: const Color(0xFF2b271c),
    error: Colors.red[700]!,
    onError: const Color(0xFFfff1f4),
    background: const Color(0xFFfbfdfd),
    tertiary: const Color(0xFFc2b07d),
    onBackground: const Color(0xFF231F20).withOpacity(.7),
    surface: const Color(0xFFf8fbfb),
    onSurface: const Color(0xFF231F20),
  );
// ============================================================= //
}

extension ColorSchemeExtension on ColorScheme {
  bool get isDark => brightness == Brightness.dark;
}
