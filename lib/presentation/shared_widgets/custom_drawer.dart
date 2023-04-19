import 'package:flutter/material.dart';
//
import 'package:books_genie/presentation/models/destination_info.dart';
import 'package:books_genie/presentation/navigation/constants.dart';
import 'package:books_genie/presentation/themes/app_color_scheme.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

import 'gradient_icon.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.currentPage,
    required this.onSelected,
  });
  final int currentPage;
  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              Image.asset(
                context.isDarkMode
                    ? 'assets/icons/dark/512.png'
                    : 'assets/icons/light/512.png',
                fit: BoxFit.fill,
                width: 250,
                height: 250,
              ),
              Text(
                "Books Genie",
                style: context.textTheme.titleLarge?.copyWith(
                  fontFamily: 'merriweather',
                  color: context.colorScheme.onBackground,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ...List.generate(
            navDestinations.length,
            (index) => _DrawerItem(
              onTap: () => onSelected(index),
              info: navDestinations[index],
              selected: currentPage == index,
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final bool selected;
  final DestinationInfo info;
  final void Function() onTap;
  const _DrawerItem({
    required this.selected,
    required this.info,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: selected
          ? GradientIcon(
              icon: info.iconData,
              size: 22,
              gradient: LinearGradient(
                colors: [
                  AppColorScheme.lightColorScheme.primary,
                  AppColorScheme.lightColorScheme.secondary
                ],
              ),
            )
          : Icon(info.iconData),
      title: Text(
        info.label,
        style: context.textTheme.titleMedium?.copyWith(
          color: selected ? context.colorScheme.primary : null,
        ),
      ),
    );
  }
}
