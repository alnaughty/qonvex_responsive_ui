import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';
import 'package:qonvex_responsive_ui/views/facebook_view.dart';
import 'package:qonvex_responsive_ui/views/youtube_view.dart';

///UI Types for users
enum QonvexUIType {
  youtube,
  facebook,
}

///This decides whether the
///user gets a youtube like view or facebook like view
extension QonvexUiView on QonvexUIType {
  Widget display(QonvexUISettings settings, List<QonvexItem> items) {
    switch (this) {
      case QonvexUIType.facebook:

        ///On this case we will be displaying facebook view
        return FaceBookView(
          settings: settings,
          items: items,
        );
      default:

        /// but by default it will be displaying a youtube like view
        return YouTubeView(
          settings: settings,
          items: items,
        );
    }
  }
}
