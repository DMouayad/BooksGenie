import 'package:flutter/material.dart';

class MD3ColorScheme {
  final Color? background;

  final Color? error;

  final Color? errorContainer;

  final Color? onBackground;

  final Color? onError;

  final Color? onErrorContainer;

  final Color? onPrimary;

  final Color? onPrimaryContainer;

  final Color? onSecondary;

  final Color? onSecondaryContainer;

  final Color? onSurface;

  final Color? onSurfaceVariant;

  final Color? onTertiary;

  final Color? onTertiaryContainer;

  final Color? outline;

  final Color? primary;

  final Color? primaryContainer;

  ///
  final Color? secondary;

  final Color? secondaryContainer;

  final Color? surface;

  /// surface at elevation 5 - surface + 14% Primary
  final Color? surfaceAtFive;

  /// surface at elevation 4 - surface + 12% Primary
  final Color? surfaceAtFour;

  /// surface at elevation 1 - surface + 5% Primary
  final Color? surfaceAtOne;

  /// surface at elevation 3 - surface + 11% Primary
  final Color? surfaceAtThree;

  /// surface at elevation 2 - surface + 8% Primary
  final Color? surfaceAtTwo;

  final Color? surfaceVariant;

  final Color? tertiary;

  final Color? tertiaryContainer;

  const MD3ColorScheme({
    this.background,
    this.error,
    this.errorContainer,
    this.onBackground,
    this.onError,
    this.onErrorContainer,
    this.onPrimary,
    this.onPrimaryContainer,
    this.onSecondary,
    this.onSecondaryContainer,
    this.onSurface,
    this.onSurfaceVariant,
    this.onTertiary,
    this.onTertiaryContainer,
    this.outline,
    this.primary,
    this.primaryContainer,
    this.secondary,
    this.secondaryContainer,
    this.surface,
    this.surfaceAtFive,
    this.surfaceAtFour,
    this.surfaceAtOne,
    this.surfaceAtThree,
    this.surfaceAtTwo,
    this.surfaceVariant,
    this.tertiary,
    this.tertiaryContainer,
  });

  const MD3ColorScheme.light({
    ///Neutral99 - 99% white
    this.background,

    ///
    /// Error40 - 40% white
    this.error,

    /// Error90 - 90% white
    this.errorContainer,

    ///Neutral10 - 10% white
    this.onBackground,

    /// Error100 - 100% white
    this.onError,

    /// Error10 - 10% white
    this.onErrorContainer,

    /// Primary100 - 100% white
    this.onPrimary,

    /// Primary10 - 10% white
    this.onPrimaryContainer,

    /// Secondary100 - 100% white
    this.onSecondary,

    /// Secondary10 - 10% white
    this.onSecondaryContainer,

    ///Neutral10 - 10% white
    this.onSurface,

    ///Neutral-Variant30 - 30% white
    this.onSurfaceVariant,

    /// Tertiary100 - 100% white
    this.onTertiary,

    /// Tertiary10 - 10% white
    this.onTertiaryContainer,

    ///Neutral-Variant50 - 50% white
    this.outline,

    /// Primary40 - 40% white
    this.primary,

    /// Primary90 - 90% white
    this.primaryContainer,

    ///
    /// Secondary40 - 40% white
    this.secondary,

    /// Secondary90 - 90% white
    this.secondaryContainer,

    ///Neutral99 - 99% white
    this.surface,

    /// surface at elevation 5 - surface + 14% Primary
    this.surfaceAtFive,

    /// surface at elevation 4 - surface + 12% Primary
    this.surfaceAtFour,

    /// surface at elevation 1 - surface + 5% Primary
    this.surfaceAtOne,

    /// surface at elevation 3 - surface + 11% Primary
    this.surfaceAtThree,

    /// surface at elevation 2 - surface + 8% Primary
    this.surfaceAtTwo,

    ///Neutral-Variant90 - 90% white
    this.surfaceVariant,

    ///
    /// Tertiary40 - 40% white
    this.tertiary,

    /// Tertiary90 - 90% white
    this.tertiaryContainer,
  });
  const MD3ColorScheme.dark({
    ///Neutral99 - 99% white
    this.background,

    ///
    /// Error40 - 40% white
    this.error,

    /// Error90 - 90% white
    this.errorContainer,

    ///Neutral10 - 10% white
    this.onBackground,

    /// Error100 - 100% white
    this.onError,

    /// Error10 - 10% white
    this.onErrorContainer,

    /// Primary100 - 100% white
    this.onPrimary,

    /// Primary10 - 10% white
    this.onPrimaryContainer,

    /// Secondary100 - 100% white
    this.onSecondary,

    /// Secondary10 - 10% white
    this.onSecondaryContainer,

    ///Neutral10 - 10% white
    this.onSurface,

    ///Neutral-Variant30 - 30% white
    this.onSurfaceVariant,

    /// Tertiary100 - 100% white
    this.onTertiary,

    /// Tertiary10 - 10% white
    this.onTertiaryContainer,

    ///Neutral-Variant50 - 50% white
    this.outline,

    /// Primary40 - 40% white
    this.primary,

    /// Primary90 - 90% white
    this.primaryContainer,

    ///
    /// Secondary40 - 40% white
    this.secondary,

    /// Secondary90 - 90% white
    this.secondaryContainer,

    ///Neutral99 - 99% white
    this.surface,

    /// surface at elevation 5 - surface + 14% Primary
    this.surfaceAtFive,

    /// surface at elevation 4 - surface + 12% Primary
    this.surfaceAtFour,

    /// surface at elevation 1 - surface + 5% Primary
    this.surfaceAtOne,

    /// surface at elevation 3 - surface + 11% Primary
    this.surfaceAtThree,

    /// surface at elevation 2 - surface + 8% Primary
    this.surfaceAtTwo,

    ///Neutral-Variant90 - 90% white
    this.surfaceVariant,

    ///
    /// Tertiary40 - 40% white
    this.tertiary,

    /// Tertiary90 - 90% white
    this.tertiaryContainer,
  });
}
