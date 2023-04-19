import 'package:books_genie/presentation/models/destination_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<DestinationInfo> navDestinations = [
  DestinationInfo(
    label: 'Library',
    iconData: Icons.book,
  ),
  DestinationInfo(
    label: 'Explore',
    iconData: CupertinoIcons.compass,
  ),
  DestinationInfo(
    label: 'Settings',
    iconData: Icons.settings_rounded,
  ),
];
