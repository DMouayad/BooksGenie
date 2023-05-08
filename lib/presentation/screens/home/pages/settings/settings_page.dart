import 'package:books_genie/blocs/preferences_cubit/preferences_cubit.dart';
import 'package:books_genie/presentation/shared_widgets/custom_app_bar.dart';
import 'package:books_genie/presentation/shared_widgets/section_header.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        CustomAppbar(
          expandedHeight: context.appBarExpandedHeight,
          animateComponentsOnInit: false,
          scrollController: scrollController,
          titleText: 'Settings',
        ),
        SliverFillRemaining(
          child: BlocBuilder<PreferencesCubit, PreferencesState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SectionHeader(title: "Appearance Settings"),
                  _SettingTile<ThemeMode>(
                    title: 'App Theme',
                    iconData: Icons.color_lens_outlined,
                    items: ThemeMode.values,
                    currentValue: state.themeMode,
                    onItemSelected: (theme) {
                      context
                          .read<PreferencesCubit>()
                          .setThemeModePreference(theme!);
                    },
                    itemToStringConvert: (themeMode) => themeMode.name,
                  ),
                  _SettingTile<Locale>(
                    title: 'App Language',
                    iconData: FontAwesomeIcons.language,
                    items: const [Locale('en'), Locale('ar')],
                    currentValue: state.locale,
                    onItemSelected: (locale) {
                      if (locale != null) {
                        context
                            .read<PreferencesCubit>()
                            .setLocalePreference(locale);
                      }
                    },
                    itemToStringConvert: (item) => item.languageCode,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class _SettingTile<T> extends StatelessWidget {
  const _SettingTile({
    required this.title,
    required this.iconData,
    required this.items,
    required this.onItemSelected,
    required this.currentValue,
    required this.itemToStringConvert,
  });

  final String title;
  final IconData iconData;
  final List<T> items;
  final T currentValue;
  final void Function(T? item) onItemSelected;
  final String Function(T item) itemToStringConvert;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6),
      child: SizedBox(
        height: 60,
        child: ListTile(
          leading: Icon(iconData),
          title: Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(),
          ),
          onTap: () => showOptionsDialog(context),
        ),
      ),
    );
  }

  Future<void> showOptionsDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            titlePadding: const EdgeInsets.fromLTRB(28, 26, 28, 10),
            contentPadding: const EdgeInsets.symmetric(vertical: 24),
            title: Text(
              'Select $title',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            children: items.map((e) {
              final selected = currentValue == e;
              return SimpleDialogOption(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: Icon(
                    selected
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: selected
                        ? context.colorScheme.secondary
                        : context.colorScheme.onBackground,
                  ),
                  title: Text(
                    itemToStringConvert(e),
                    style: context.textTheme.titleMedium,
                  ),
                ),
                onPressed: () {
                  context.pop();
                  onItemSelected(e);
                },
              );
            }).toList(),
          );
        });
  }
}
