import 'dart:math';

import 'package:books_genie/blocs/preferences_cubit/preferences_cubit.dart';
import 'package:books_genie/presentation/themes/material_themes.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StorageOptionSetupScreen extends StatefulWidget {
  const StorageOptionSetupScreen({super.key});

  @override
  _StorageOptionSetupScreenState createState() =>
      _StorageOptionSetupScreenState();
}

class _StorageOptionSetupScreenState extends State<StorageOptionSetupScreen> {
  StorageOption selectedOption = StorageOption.online;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MaterialAppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            child: Flex(
              direction:
                  context.isLandscapeMobile ? Axis.horizontal : Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Image.asset(
                    'assets/logo_light.png',
                    height: context.screenHeight * .4,
                    width: context.isMobile
                        ? double.infinity
                        : context.screenWidth * .6,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        child: Text(
                          "Please choose how you'd prefer to store your account and books information:",
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22.0,
                    ),
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          child: _OptionCard(
                            selected: selectedOption == StorageOption.online,
                            iconData: FontAwesomeIcons.cloudArrowUp,
                            title: StorageOption.online.name,
                            description: const [
                              "Stored securely in the cloud.",
                              "Will not be lost if you uninstall the application."
                            ],
                            onPressed: () => setOption(StorageOption.online),
                          ),
                        ),
                        SizedBox(
                          width: context.isMobile ? 14 : 30,
                        ),
                        Flexible(
                          child: _OptionCard(
                            title: StorageOption.offline.name,
                            iconData: FontAwesomeIcons.toggleOff,
                            selected: selectedOption == StorageOption.offline,
                            description: const [
                              'Can be accessed on this device only.',
                              'Wil be deleted with the application.'
                            ],
                            onPressed: () => setOption(StorageOption.offline),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!context.isLandscapeMobile && context.screenHeight > 850)
                  const Spacer()
                else
                  const SizedBox(height: 40),
                _ContinueButton(selectedOption: selectedOption),
                if (!context.isLandscapeMobile && context.screenHeight > 850)
                  const Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }

  setOption(StorageOption option) {
    setState(() {
      selectedOption = option;
    });
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.selectedOption});

  final StorageOption selectedOption;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(context.screenWidth * .5, 54),
        ),
      ),
      onPressed: () {
        context.read<PreferencesCubit>().setStorageOption(selectedOption);
      },
      icon: const Icon(Icons.arrow_forward_rounded),
      label: const Text('CONTINUE'),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final List<String> description;
  final void Function() onPressed;
  final bool selected;

  const _OptionCard({
    required this.iconData,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: min(300, context.screenWidth * .5),
          maxHeight: context.isMobile
              ? context.screenHeight * .4
              : min(350, context.screenHeight * .3),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: selected
              ? Border.all(
                  color: context.colorScheme.secondary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 3,
                )
              : null,
          color: context.colorScheme.primaryContainer,
        ),
        padding: const EdgeInsets.only(top: 26, bottom: 20),
        child: Column(
          children: [
            Icon(iconData, size: 30),
            const SizedBox(height: 20),
            Flexible(
              child: Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...description
                .map((e) => Flexible(
                      child: ListTile(
                        minLeadingWidth: 5,
                        leading: const Icon(Icons.circle, size: 7),
                        dense: true,
                        title: Text(e),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
