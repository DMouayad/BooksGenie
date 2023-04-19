import 'package:flutter/material.dart';

import 'custom_nav_rail.dart';

class ScaffoldWithNavRail extends StatelessWidget {
  final int currentPage;
  final Widget body;
  final void Function(int) onDestinationSelected;

  const ScaffoldWithNavRail({
    super.key,
    required this.currentPage,
    required this.body,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Row(
          children: [
            CustomNavRail(
              currentPage: currentPage,
              onDestinationSelected: onDestinationSelected,
            ),
            VerticalDivider(
              color: Colors.grey.shade300,
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
