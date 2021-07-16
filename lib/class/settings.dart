import 'package:flutter/material.dart';

///Provides UI Settings for the user
class QonvexUISettings {
  final ImageProvider appLogo;
  final List<Widget>? appHeaderActions;
  final IconData drawerIcon;
  final Color foregroundColor;

  QonvexUISettings(
      {required this.appLogo,
      this.appHeaderActions,
      this.drawerIcon = Icons.menu,
      this.foregroundColor = Colors.blue});
}
