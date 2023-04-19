import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/presentation/shared_widgets/gradient_icon.dart';
import 'package:books_genie/presentation/themes/app_color_scheme.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onSelectedIndexChange;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onSelectedIndexChange,
  });

  BottomNavigationBarItem getItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: CustomNavBarIcon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: [
        getItem('My library', Icons.book),
        getItem('Explore', CupertinoIcons.compass),
        getItem('Settings', Icons.settings_rounded),
      ],
      onTap: onSelectedIndexChange,
    );
  }
}

class CustomNavBarIcon extends StatelessWidget {
  final IconData iconData;
  const CustomNavBarIcon(this.iconData, {super.key});

  @override
  Widget build(BuildContext context) {
    return GradientIcon(
      icon: iconData,
      size: 22,
      gradient: LinearGradient(
        colors: [
          AppColorScheme.lightColorScheme.primary,
          AppColorScheme.lightColorScheme.secondary
        ],
      ),
    );
  }
}
