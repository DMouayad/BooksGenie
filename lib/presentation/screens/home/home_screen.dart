import 'package:books_genie/presentation/screens/home/pages/settings/settings_page.dart';
import 'package:books_genie/presentation/shared_widgets/custom_nav_rail.dart';
import 'package:flutter/material.dart';
//
import 'package:books_genie/presentation/shared_widgets/custom_drawer.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'pages/explore/explore_page.dart';
import 'pages/my_library/my_library_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 1;
  late final PageController pageController =
      PageController(initialPage: currentPage);
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 1400),
    vsync: this,
  )..forward();

  late final ExplorePageInitAnimations _explorePageInitAnimations =
      ExplorePageInitAnimations(_animationController);

  late final List<Widget> pages = [
    const MyLibraryPage(),
    ExplorePage(initAnimations: _explorePageInitAnimations),
    const SettingsPage(),
  ];

  late final pageView = PageView.builder(
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    controller: pageController,
    itemCount: pages.length,
    onPageChanged: (page) => currentPage = page,
    itemBuilder: (BuildContext context, int index) {
      return pages[index];
    },
  );

  @override
  Widget build(BuildContext context) {
    final showNavRail = !(context.isMobile || context.isPortraitTablet);

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: showNavRail
          ? null
          : Builder(builder: (context) {
              return CustomDrawer(
                currentPage: currentPage,
                onSelected: ((index) {
                  Scaffold.of(context).closeDrawer();
                  _onPageChanged(index);
                }),
              );
            }),
      body: SafeArea(
        child: !showNavRail
            ? pageView
            : Row(
                children: [
                  CustomNavRail(
                    currentPage: currentPage,
                    onDestinationSelected: _onPageChanged,
                  ),
                  VerticalDivider(
                    color: context.colorScheme.onBackground.withOpacity(.18),
                  ),
                  Expanded(child: pageView),
                ],
              ),
      ),
    );
  }

  void _onPageChanged(int index) {
    pageController.animateToPage(
      index,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 400),
    );
  }
}
