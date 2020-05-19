import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 50),
            color: Colors.greenAccent, // if you want this color under bottom bar add the margin to list view
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (_, int index) => Text("Text $index"),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.amber.withOpacity(.5),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (int index) => Text("Text $index")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
