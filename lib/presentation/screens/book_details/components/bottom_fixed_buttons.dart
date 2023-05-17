import 'package:books_genie/support/services/url_launcher_service.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class BottomFixedButtons extends StatelessWidget {
  final Uri? previewLink;
  final Uri? buyLink;

  const BottomFixedButtons({
    super.key,
    required this.previewLink,
    required this.buyLink,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      elevation: MaterialStateProperty.all(7),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
    );
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 4),
      color: context.colorScheme.background.withOpacity(.9),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FilledButton(
              style: buttonStyle.copyWith(
                backgroundColor: context.isDarkMode
                    ? MaterialStateProperty.all(
                        context.colorScheme.onBackground)
                    : null,
              ),
              onPressed: () async {
                await UrlLauncherService.launchInExternalApp(previewLink);
              },
              child: const Text("Preview"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () async {
                await UrlLauncherService.launchInExternalApp(buyLink);
              },
              child: Material(
                elevation: 7,
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      context.colorScheme.primary,
                      context.colorScheme.secondary
                    ]),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Get this book",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
