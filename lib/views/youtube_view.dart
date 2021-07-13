import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/class/item.dart';
import 'package:qonvex_responsive_ui/class/settings.dart';
import 'package:qonvex_responsive_ui/services/color_checker.dart';
import 'package:qonvex_responsive_ui/views/youtube_drawer/drawer.dart';

class YouTubeView extends StatefulWidget {
  final QonvexUISettings settings;
  final List<QonvexItem> items;
  YouTubeView({Key? key , required this.settings, required this.items}) : super(key: key);
  @override
  _YouTubeViewState createState() => _YouTubeViewState();
}

class _YouTubeViewState extends State<YouTubeView> {
  Image logo(ImageProvider provider) {
    return Image(
      fit: BoxFit.fitHeight,
        image: provider,
    );
  }
  late QonvexUISettings settings = widget.settings;
  late Widget _selectedChild = widget.items[0].child;
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  late Size _size;
  bool _isToggled = false;
  @override
  void initState() {
    super.initState();
  }
  void toggle(){
    if(_size.width <= 1300){
      ///TABLET && MOBILE
      setState(() {
        _isToggled = !_scaffoldState.currentState!.isDrawerOpen;
      });
      _scaffoldState.currentState!.openDrawer();

    }else{
      setState(() {
        _isToggled = !_isToggled;
      });
    }
  }
  late Color _decidedColor = QonvexColorChecker.check(settings.foregroundColor);
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    if(_scaffoldState.currentState != null && _scaffoldState.currentState!.isDrawerOpen && _size.width > 1300){
      try{
        _scaffoldState.currentState!.openEndDrawer();
        _isToggled = true;
      }catch(e){
        _isToggled = false;
        throw e;
      }
    }
    try{
      return Scaffold(
        key: _scaffoldState,
        body: Row(
          children: [
            if(_size.width > 800 && _size.width <= 1300)...{
              Container(
                width: 55,
                color: settings.foregroundColor,
                child: ListView(
                  children: [
                    for(QonvexItem item in widget.items)...{
                      Tooltip(
                        message: "${item.title}",
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          onPressed: (){
                            setState(() {
                              _selectedChild = item.child;
                            });
                          },
                          child: Center(
                            child: Icon(item.icon, color: _decidedColor,),
                          )
                        ),
                      )
                    }
                  ],
                ),
              )
            }else if(_size.width >= 1300)...{
              YoutubeDrawer(color: settings.foregroundColor, menuIcon: settings.drawerIcon,appTitle: logo(settings.appLogo), isToggled: _size.width > 800 && _size.width < 1300 ? false : _isToggled,items: widget.items, onPressed: (Widget child){
                setState(() => _selectedChild = child);
              }),
            },
            Expanded(child: _selectedChild)
          ],
        ),
        drawer: _size.width > 1300 && kIsWeb ? null : YoutubeDrawer(color: settings.foregroundColor, menuIcon: settings.drawerIcon,appTitle: logo(settings.appLogo), isToggled: _isToggled,items: widget.items, onPressed: (Widget child){
          setState(() => _selectedChild = child);
        }),
        appBar: AppBar(
          toolbarHeight: 10,
          textTheme: TextTheme(
            caption: TextStyle(
              color: _decidedColor
            )
          ),
          iconTheme: IconThemeData(
            color: _decidedColor
          ),
          title: logo(settings.appLogo),
          centerTitle: false,
          backgroundColor: settings.foregroundColor,
          actions: settings.appHeaderActions,
          leading: IconButton(
            icon: Icon(settings.drawerIcon,),
            onPressed: (){
              toggle();
            },
          ),
        ),
      );
    }catch(e){
      return Material(
        child: widget.items.length == 0 ? Center(
          child: Text("PLEASE ADD SOME DATA IN ITEMS"),
        ) : Center(
          child: Text("AN ERROR HAS OCCURRED : $e",textAlign: TextAlign.center,),
        ),
      );
    }
  }
}
