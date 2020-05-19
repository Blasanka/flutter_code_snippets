
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SO answers sample snippet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 200,
            ),
            Container(
              height: 200,
              color: Colors.red,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SvgPicture.asset('assets/Freesample.svg', semanticsLabel: 'Flask', color: Colors.black, width: 100,height: 100,)
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}