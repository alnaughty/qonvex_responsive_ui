import 'package:flutter/material.dart';
import 'package:qonvex_responsive_ui/constants.dart';
import 'package:qonvex_responsive_ui/qonvex_responsive_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qonvex Responsive UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return QonvexResponsiveUi(
      settings: QonvexUISettings(
        appHeaderActions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.message))
        ],
        appLogo: NetworkImage("https://www.strunkmedia.com/wp-content/uploads/2018/05/bigstock-Print-163213010.png"),
        foregroundColor: Colors.grey.shade100,
      ),
      type: QonvexUIType.youtube,
      items: [
        QonvexItem(
          icon: Icons.space_dashboard,
          title: "Dashboard",
          child: Container(
            color: Colors.red,
          ),
        ),
        QonvexItem(
          icon: Icons.home_filled,
          title: "Home",
          child: Container(
            color: Colors.blue,
          ),
        ),
        QonvexItem(
          icon: Icons.person_outline,
          title: "Profile",
          child: Container(
            color: Colors.green,
          ),
        ),
        QonvexItem(
          icon: Icons.settings,
          title: "Settings",
          child: Container(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
