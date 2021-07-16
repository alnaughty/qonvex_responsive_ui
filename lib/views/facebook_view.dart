import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';
import 'package:qonvex_responsive_ui/services/color_checker.dart';

class FaceBookView extends StatefulWidget {
  ///Settings given by the user;
  final QonvexUISettings settings;

  ///Tab items for this view
  final List<QonvexItem> items;

  FaceBookView({Key? key, required this.settings, required this.items})
      : super(key: key);

  @override
  _FaceBookViewState createState() => _FaceBookViewState();
}

class _FaceBookViewState extends State<FaceBookView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController =
      new TabController(length: widget.items.length, vsync: this);
  late QonvexUISettings settings = widget.settings;
  late Color mainColor = QonvexColorChecker.check(settings.foregroundColor);
  late Color secondaryColor =
      QonvexColorChecker.checkNegative(settings.foregroundColor);

  @override
  void initState() {
    super.initState();
  }

  Image logo(ImageProvider provider) {
    return Image(
      fit: BoxFit.fitHeight,
      image: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool _isWeb = size.width > 1300;
    return Scaffold(
      appBar: kIsWeb && _isWeb
          ? null
          : AppBar(
              iconTheme: IconThemeData(color: mainColor),
              centerTitle: false,
              elevation: 0,
              title: Container(
                width: 120,
                height: 40,
                alignment: AlignmentDirectional.centerStart,
                child: logo(settings.appLogo),
              ),
              backgroundColor: settings.foregroundColor,
              actions: settings.appHeaderActions,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width > 800 && size.width < 1300
                          ? size.width * .2
                          : 0),
                  color: settings.foregroundColor,
                  child: tabBar(),
                ),
              ),
            ),
      body: Column(
        children: [
          if (kIsWeb && _isWeb) ...{
            Container(
                color: settings.foregroundColor,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60.0 * 4,
                      constraints: BoxConstraints(maxWidth: 60.0 * 4),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: AlignmentDirectional.centerStart,
                      child: logo(settings.appLogo),
                    ),
                    Container(width: 700, height: 60, child: tabBar()),
                    Container(
                      width: 60.0 * 4,
                      constraints: BoxConstraints(
                        maxWidth: 60.0 * 4,
                      ),
                      height: 60,
                      child: settings.appHeaderActions != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                for (Widget action
                                    in settings.appHeaderActions!) ...{
                                  Theme(
                                    data: ThemeData(
                                        iconTheme:
                                            IconThemeData(color: mainColor)),
                                    child: action,
                                  )
                                }
                              ],
                            )
                          : Container(),
                    )
                  ],
                ))
          },
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                for (QonvexItem item in widget.items) ...{item.child}
              ],
            ),
          )
        ],
      ),
    );
  }

  TabBar tabBar() => TabBar(
        indicatorColor: mainColor,
        labelColor: mainColor,
        unselectedLabelColor: Colors.grey.withOpacity(0.5),
        controller: _tabController,
        tabs: [
          for (QonvexItem item in widget.items) ...{
            Tab(
              icon: Icon(item.icon),
            )
          }
        ],
      );
}
