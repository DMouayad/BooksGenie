import 'package:flutter/material.dart';

class FadeSlideTransition extends StatelessWidget {
  final bool animate;
  final Animation<double>? fadeAnimation;
  final Animation<Offset>? slideAnimation;
  final Widget child;

  const FadeSlideTransition({
    super.key,
    this.fadeAnimation,
    this.slideAnimation,
    required this.animate,
    required this.child,
  }) : assert(!animate ||
            animate && (fadeAnimation != null && slideAnimation != null));

  @override
  Widget build(BuildContext context) {
    if (!animate) return child;
    return SlideTransition(
      position: slideAnimation!,
      child: FadeTransition(
        opacity: fadeAnimation!,
        child: child,
      ),
    );
  }
}
