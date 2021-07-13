import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';

class FaceBookView extends StatefulWidget {
  final QonvexUISettings settings;
  final List<QonvexItem> items;
  FaceBookView({Key? key, required this.settings, required this.items}) : super(key: key);
  @override
  _FaceBookViewState createState() => _FaceBookViewState();
}

class _FaceBookViewState extends State<FaceBookView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
