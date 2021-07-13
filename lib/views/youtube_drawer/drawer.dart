import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/services/color_checker.dart';

@immutable
class YoutubeDrawer extends StatelessWidget {
  final List<QonvexItem> items;
  final ValueChanged<Widget> onPressed;
  final bool isToggled;
  final Widget appTitle;
  final IconData menuIcon;
  final Color color;

  YoutubeDrawer(
      {required this.items,
      required this.onPressed,
      required this.isToggled,
      required this.appTitle,
      required this.menuIcon,
      required this.color});

  late final Color _decidedColor = QonvexColorChecker.check(color);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool _isWeb = size.width > 1300;
    return !_isWeb
        ? Drawer(
            child: listData(context, _isWeb),
          )
        : AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: !isToggled ? 55 : 300,
            color: Colors.white,
            child: listData(context, _isWeb));
  }

  Widget listData(context, bool isWeb) {
    try {
      return Container(
        color: color,
        child: ListView(
          children: [
            if (!isWeb) ...{
              Container(
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(null);
                      },
                      icon: Icon(
                        menuIcon,
                        color: _decidedColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: appTitle,
                    ))
                  ],
                ),
              )
            },
            for (QonvexItem item in items) ...{
              if ((!isWeb || (isWeb && isToggled))) ...{
                MaterialButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: !isWeb || (isWeb && isToggled) ? 20 : 0,
                      vertical: 25),
                  onPressed: () {
                    if (!isWeb) {
                      Navigator.of(context).pop(null);
                    }
                    onPressed(item.child);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: _decidedColor,
                      ),
                      if (!isWeb || (isWeb && isToggled)) ...{
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "${item.title}",
                            style: TextStyle(color: _decidedColor),
                          ),
                        )
                      }
                    ],
                  ),
                ),
              } else ...{
                Tooltip(
                  message: "${item.title}",
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: !isWeb || (isWeb && isToggled) ? 20 : 0,
                        vertical: 25),
                    onPressed: () {
                      if (!isWeb) {
                        Navigator.of(context).pop(null);
                      }
                      onPressed(item.child);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon,
                          color: _decidedColor,
                        ),
                        if (!isWeb || (isWeb && isToggled)) ...{
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "${item.title}",
                              style: TextStyle(color: _decidedColor),
                            ),
                          )
                        }
                      ],
                    ),
                  ),
                )
              }
            }
          ],
        ),
      );
    } catch (e) {
      throw e;
    }
  }
}
