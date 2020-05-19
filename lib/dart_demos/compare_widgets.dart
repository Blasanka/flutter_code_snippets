import 'package:flutter/material.dart';

Widget compareTwoWidgets() {


  List<Widget> widgetList = [];

  widgetList.add(WidgetA());
  widgetList.add(WidgetB());
  widgetList.add(WidgetC());
  widgetList.add(WidgetD());

  Widget activeWidget = widgetList.firstWhere((element) => element.runtimeType == WidgetD().runtimeType);
  print(activeWidget);

  // using key
  List activeWidget1 = widgetList.where((element) => element.toStringShort() == WidgetD().toStringShort()).toList();
  print(WidgetD().toStringShort());
}




class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
