import 'package:flutter/material.dart';
import 'package:books_genie/presentation/shared_widgets/fade_slide_transition.dart';
import 'package:books_genie/presentation/shared_widgets/section_header.dart';

class PageSection extends StatelessWidget {
  const PageSection({
    super.key,
    this.slideAnimation,
    this.fadeAnimation,
    required this.title,
    required this.body,
    this.animate = true,
  });
  final String title;
  final Widget body;
  final Animation<Offset>? slideAnimation;
  final Animation<double>? fadeAnimation;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        () {
          final header = SectionHeader(title: title);
          return (fadeAnimation != null)
              ? FadeTransition(opacity: fadeAnimation!, child: header)
              : header;
        }(),
        FadeSlideTransition(
          fadeAnimation: fadeAnimation,
          slideAnimation: slideAnimation,
          animate: animate && (fadeAnimation != null && slideAnimation != null),
          child: body,
        ),
      ],
    );
  }
}
