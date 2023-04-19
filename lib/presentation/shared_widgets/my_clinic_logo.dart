import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class MyClinicLogo extends StatelessWidget {
  const MyClinicLogo({
    Key? key,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
  }) : super(key: key);

  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "app-logo",
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: LineIcon.medicalClinic(
                color: context.colorScheme.secondary,
                size: 35,
              ),
            ),
            Expanded(
              flex: 0,
              child: Text(
                "MyClinic",
                style: context.textTheme.headlineLarge?.copyWith(
                  fontSize: fontSize,
                  fontFamily: "pierSans",
                  color: fontColor ?? context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
