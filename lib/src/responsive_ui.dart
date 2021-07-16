import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';
import 'package:qonvex_responsive_ui/constants.dart';

export 'package:qonvex_responsive_ui/class/settings.dart';
export 'package:qonvex_responsive_ui/class/item.dart';

///This is the class that calls our main ui page
class QonvexResponsiveUi extends StatefulWidget {
  final QonvexUIType type;
  final QonvexUISettings settings;
  final List<QonvexItem> items;

  QonvexResponsiveUi(
      {Key? key,
      this.type = QonvexUIType.youtube,
      required this.settings,
      required this.items})
      : super(key: key);

  @override
  QonvexResponsiveUiState createState() => QonvexResponsiveUiState();
}

class QonvexResponsiveUiState extends State<QonvexResponsiveUi> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.type.display(widget.settings, widget.items),
    );
  }
}
