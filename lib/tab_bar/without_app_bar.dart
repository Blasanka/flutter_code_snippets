
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tab bar without appbar',
      home: TemplesListingWithTabMode(),
    );
  }
}

class TemplesListingWithTabMode extends StatefulWidget {
  TemplesListingWithTabMode({Key key}) : super(key: key);

  @override
  _TemplesListingWithTabModeState createState() =>
      _TemplesListingWithTabModeState();
}

class _TemplesListingWithTabModeState extends State<TemplesListingWithTabMode> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: TabBar(
                indicatorColor: Colors.pink,
                tabs: [
                  Tab(
                    child: Text("ALL",style: TextStyle(color: Colors.pink),),
                  ),Tab(
                    child: Text("Favorites",style: TextStyle(color: Colors.pink),),
                  )
                ]),
          ),
          body  : Container(
            color: Colors.grey,
            child: TabBarView(
                children: [
                  ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context,index){
                        return Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("i am $index"),
                            ),
                          ),
                        );
                      }),
                  ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("i am $index"),
                            ),
                          ),
                        );
                      })
                ]),
          ),
        ),
      ),
    );
  }
}