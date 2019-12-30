
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Clipper Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: List.generate(10, (int index) {
            return ParentWidget(
              data: index,
              function: () => print("whooo! $index"),
              child: Text(index.toString(), style: TextStyle(fontSize: 20)),
            );
          }),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  final Widget child;
  final int data;
  final Function function;

  ParentWidget({this.child, this.data, this.function});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Container(
        child: (widget.child != null) ? widget.child : SizedBox(),
      ),
    );
  }
}