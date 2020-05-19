import 'package:flutter/material.dart';
import 'package:horizontal_indicator/horizontal_indicator.dart';

class DateIndicatorPage extends StatefulWidget {

  @override
  _DateIndicatorPageState createState() => _DateIndicatorPageState();
}

class _DateIndicatorPageState extends State<DateIndicatorPage> {
  int selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 68),
          child: DateIndicator(
            onHolderTap: (int day) => setState(() => selectedDay = day),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(child: Text("$selectedDay")),
            ),
          ),
        ],
      ),
    );
  }
}