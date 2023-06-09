import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/presentation/shared_widgets/fade_slide_transition.dart';
import 'package:books_genie/presentation/shared_widgets/profile_icon_button.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class CustomAppbar extends StatelessWidget {
  final ScrollController scrollController;
  final bool animateComponentsOnInit;
  final Animation<Offset>? searchBarSlideAnimation;
  final Animation<double>? searchBarFadeAnimation;
  final Animation<Offset>? welcomeMessageSlideAnimation;
  final Animation<double>? welcomeMessageFadeAnimation;
  final Widget? title;
  final String? titleText;
  final double expandedHeight;

  final Widget? searchBox;

  const CustomAppbar({
    super.key,
    required this.expandedHeight,
    this.searchBarFadeAnimation,
    this.searchBarSlideAnimation,
    this.welcomeMessageSlideAnimation,
    this.welcomeMessageFadeAnimation,
    this.title,
    this.titleText,
    this.searchBox,
    required this.animateComponentsOnInit,
    required this.scrollController,
  }) : assert(
          (!animateComponentsOnInit) ||
              (animateComponentsOnInit &&
                  searchBarFadeAnimation != null &&
                  searchBarSlideAnimation != null &&
                  welcomeMessageSlideAnimation != null &&
                  welcomeMessageFadeAnimation != null),
        );

  @override
  Widget build(BuildContext context) {
    final showActionsAndLeadingIcons =
        (context.isMobile || context.isPortraitTablet);

    return SliverAppBar.medium(
      pinned: true,
      elevation: 0,
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      // (
      // statusBarColor: context.colorScheme.background,
      // systemNavigationBarColor: context.colorScheme.background,
      //   systemNavigationBarColor: context.colorScheme.background,
      //   systemNavigationBarContrastEnforced: true,
      //   statusBarIconBrightness: context.colorScheme.brightness,
      // systemNavigationBarContrastEnforced: true,
      // ),
      automaticallyImplyLeading: false,
      expandedHeight: expandedHeight,
      scrolledUnderElevation: 0,
      collapsedHeight: 80,
      leading: showActionsAndLeadingIcons
          ? CustomAnimatedBuilder(
              animation: scrollController,
              animatedChildBuilder: (BuildContext context, Widget? child) {
                final position =
                    scrollController.position.pixels / context.screenHeight;
                return Positioned(
                  left: -(position * context.screenWidth),
                  right: 0,
                  child: child!,
                );
                // return child!;
              },
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  CupertinoIcons.text_justifyleft,
                  size: 22,
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
            )
          : null,
      actions: !showActionsAndLeadingIcons
          ? null
          : [
              SizedBox(
                width: 60,
                child: CustomAnimatedBuilder(
                  animation: scrollController,
                  animatedChildBuilder: (BuildContext context, Widget? child) {
                    final position =
                        scrollController.position.pixels / context.screenHeight;
                    return Positioned(
                      right: -(position * context.screenWidth),
                      left: 0,
                      child: child!,
                    );
                  },
                  child: const ProfileIconButton(),
                ),
              ),
            ],
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            expandedTitleScale: 1,
            titlePadding: const EdgeInsets.only(bottom: 8),
            background: FadeSlideTransition(
              animate: animateComponentsOnInit,
              slideAnimation: welcomeMessageSlideAnimation,
              fadeAnimation: welcomeMessageFadeAnimation,
              child:
                  _Title(scrollController, title: title, titleText: titleText),
            ),
            title: searchBox == null
                ? null
                : CustomAnimatedBuilder(
                    animation: scrollController,
                    animatedChildBuilder: (BuildContext context, Widget child) {
                      final c1 = expandedHeight /
                          (min(expandedHeight, scrollController.offset));
                      final position = 6.0 * min(2.0, c1 - 1.0);
                      return Positioned(
                        left: position,
                        right: position,
                        bottom: position,
                        child: child,
                      );
                    },
                    child: FadeSlideTransition(
                      slideAnimation: searchBarSlideAnimation,
                      fadeAnimation: searchBarFadeAnimation,
                      animate: animateComponentsOnInit,
                      child: SizedBox(
                        height: 54,
                        child: searchBox,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class CustomAnimatedBuilder extends StatelessWidget {
  const CustomAnimatedBuilder({
    super.key,
    required this.child,
    required this.animatedChildBuilder,
    required this.animation,
  });

  final Widget child;
  final Widget Function(BuildContext context, Widget child)
      animatedChildBuilder;
  final Listenable animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            animatedChildBuilder(context, child!),
          ],
        );
      },
      child: child,
    );
  }
}

class _Title extends StatelessWidget {
  final ScrollController scrollController;

  const _Title(this.scrollController, {this.titleText, this.title});
  final Widget? title;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
      child: AnimatedBuilder(
        animation: scrollController,
        builder: (BuildContext context, Widget? child) {
          final opacity = (scrollController.offset > 150)
              ? 0.0
              : 1.0 -
                  (scrollController.offset /
                      (scrollController.position.viewportDimension * .4));
          return Opacity(
            opacity: opacity.abs(),
            child: child!,
          );
        },
        child: () {
          if (title != null) return title;
          if (titleText != null) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    titleText!,
                    textAlign: TextAlign.start,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          }
        }(),
      ),
    );
  }
}
