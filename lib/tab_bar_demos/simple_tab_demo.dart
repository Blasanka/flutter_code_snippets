import 'package:flutter/material.dart';

class SimpleTabBar extends StatefulWidget {
  @override
  _SimpleTabBarState createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar> {
  List<Widget> tabs;

  @override
  void initState() {
    tabs = [
      buildTab("Dart", Icons.favorite),
      buildTab("Flutter", Icons.thumb_up)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          bottom: buildTabBar(context),
        ),
        body: TabBarView(
          children: <Widget>[
            buildTabView(Colors.redAccent),
            buildTabView(Colors.greenAccent)
          ],
        ),
      ),
    );
  }

  Container buildTabView(Color color) {
    return Container(
      color: color,
      child: Column(
        children: List.generate(20, (index) => Text("$index")),
      ),
    );
  }

  Widget buildTab(String title, IconData icon) =>
      Column(children: <Widget>[Icon(icon), Text(title)]);

  TabBar buildTabBar(BuildContext context) => TabBar(tabs: tabs);
}
