import 'package:books_genie/presentation/navigation/constants.dart';
import 'package:books_genie/presentation/shared_widgets/profile_icon_button.dart';
import 'package:books_genie/presentation/themes/app_color_scheme.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';

import 'gradient_icon.dart';

class CustomNavRail extends StatefulWidget {
  final int currentPage;
  final void Function(int) onDestinationSelected;

  const CustomNavRail({
    super.key,
    required this.currentPage,
    required this.onDestinationSelected,
  });

  @override
  State<CustomNavRail> createState() => _CustomNavRailState();
}

class _CustomNavRailState extends State<CustomNavRail> {
  late int selectedIndex = widget.currentPage;
  @override
  Widget build(BuildContext context) {
    final isMobileLandscape = context.screenHeight < 470;
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() => selectedIndex = index);
        widget.onDestinationSelected(index);
      },
      labelType: NavigationRailLabelType.all,
      useIndicator: false,
      leading: Image.asset(
        context.isDarkMode
            ? 'assets/icons/dark/216.png'
            : 'assets/icons/light/88.png',
        fit: BoxFit.cover,
        width: 130,
        height: 100,
      ),
      trailing: Padding(
        padding: EdgeInsets.only(
          top: isMobileLandscape ? 30 : context.screenHeight * .3,
          bottom: isMobileLandscape ? 0 : 22,
        ),
        child: const ProfileIconButton(),
      ),
      groupAlignment: isMobileLandscape ? 0 : 1,
      destinations:
          navDestinations.map((e) => _getItem(e.label, e.iconData)).toList(),
    );
  }

  NavigationRailDestination _getItem(String label, IconData iconData) {
    return NavigationRailDestination(
      label: Text(label),
      icon: Icon(iconData),
      padding: const EdgeInsets.symmetric(vertical: 6),
      selectedIcon: GradientIcon(
        icon: iconData,
        size: 22,
        gradient: LinearGradient(
          colors: [
            AppColorScheme.lightColorScheme.primary,
            AppColorScheme.lightColorScheme.secondary
          ],
        ),
      ),
    );
  }
}
