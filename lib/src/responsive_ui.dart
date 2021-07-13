import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';
import 'package:qonvex_responsive_ui/constants.dart';

export 'package:qonvex_responsive_ui/class/settings.dart';
export 'package:qonvex_responsive_ui/class/item.dart';
class ResponsiveUi extends StatefulWidget {
  final QonvexUIType type;
  final QonvexUISettings settings;
  final List<QonvexItem> items;
  ResponsiveUi(
      {Key? key, this.type = QonvexUIType.youtube, required this.settings, required this.items})
      : super(key: key);

  @override
  ResponsiveUiState createState() => ResponsiveUiState();
}

class ResponsiveUiState extends State<ResponsiveUi> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.type.display(widget.settings, widget.items),
    );
  }
}



