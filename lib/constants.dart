import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';
import 'package:qonvex_responsive_ui/views/facebook_view.dart';
import 'package:qonvex_responsive_ui/views/youtube_view.dart';

enum QonvexUIType{
  youtube,
  facebook,
}

extension QonvexUiView on QonvexUIType {
  Widget display(QonvexUISettings settings, List<QonvexItem> items) {
    switch(this){
      case QonvexUIType.facebook :
        return FaceBookView(settings: settings, items: items,);
      default:
        return YouTubeView(settings: settings,items: items,);
    }
  }
}