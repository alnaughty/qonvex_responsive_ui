import 'package:flutter/material.dart';


class QonvexUISettings {
  final Widget appLogo;
  final List<Widget>? appHeaderActions;
  final IconData drawerIcon;
  final Color foregroundColor;
  QonvexUISettings({
    required this.appLogo,
    this.appHeaderActions,
    this.drawerIcon = Icons.menu,
    this.foregroundColor = Colors.blue
  });
}