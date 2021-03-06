import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyInheritedWidget extends InheritedWidget {

  final DateTime date;
  final int selectedDay;
  final int monthDateCount;
  final bool isDateHolderActive;
  final Map<int, bool> dayAvailabilityMap;
  final ValueChanged<bool> toggleDateHolderActive;
  final ValueChanged<int> setSelectedDay;

  MyInheritedWidget({
    Key key,
    this.date,
    this.selectedDay,
    this.monthDateCount,
    this.isDateHolderActive,
    this.dayAvailabilityMap,
    this.toggleDateHolderActive,
    this.setSelectedDay,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.selectedDay != selectedDay ||
        oldWidget.toggleDateHolderActive != toggleDateHolderActive;
  }
}

class DateIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DateIndicator(),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}


class DateIndicator extends StatefulWidget {
  static MyInheritedWidget of(BuildContext context) => context.ancestorWidgetOfExactType(MyInheritedWidget);

  @override
  _DateIndicatorState createState() => _DateIndicatorState();
}

class _DateIndicatorState extends State<DateIndicator> {
  DateTime date = DateTime.now();
  int selectedDay = 1;
  int monthDateCount = 1;
  bool isDateHolderActive = false;
  Map<int, bool> dayAvailabilityMap = {};

  void toggleDateHolderActive(bool flag) {
    setState(() {
      isDateHolderActive = flag;
    });
  }

  void setSelectedDay(int index) {
    setState(() {
      selectedDay = index;
    });
  }

  @override
  void initState() {
    final DateTime dateForValues = new DateTime(date.year, date.month + 1, 0);
    monthDateCount = dateForValues.day;

    // Just to show how to activate when something exist for this day(from network response or something)
    dayAvailabilityMap[1] = true;
    dayAvailabilityMap[2] = true;
    dayAvailabilityMap[3] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 68.0,
      padding:
      const EdgeInsets.only(left: 7.0, right: 3.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        boxShadow: [
          BoxShadow(
              color: Colors.blueAccent.withOpacity(.7),
              offset: Offset(0.0, .5),
              blurRadius: 3.0,
              spreadRadius: 0.3),
        ],
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: monthDateCount, // to avoid showing zero
          itemBuilder: (BuildContext context, int index) {
            return MyInheritedWidget(
                date: date,
                selectedDay: selectedDay,
                monthDateCount: monthDateCount,
                isDateHolderActive: isDateHolderActive,
                dayAvailabilityMap: dayAvailabilityMap,
                toggleDateHolderActive: toggleDateHolderActive,
                setSelectedDay: setSelectedDay,
                child: DateHolder(index));
          }),
    );
  }
}

class DateHolder extends StatelessWidget {
  DateHolder(this.index);

  final int index;

  final Widget activeBubble = Container(
    width: 15.0,
    height: 15.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.deepOrangeAccent,
    ),
  );

  @override
  Widget build(BuildContext context) {

    final appState = DateIndicator.of(context);

    return InkWell(
      onTap: () {
        appState.toggleDateHolderActive(true);
        appState.setSelectedDay(index);
        print("Date ${index} selected!");
      },
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    "${DateFormat('EEEE').format(DateTime(appState.date.year, appState.date.month, index)).substring(0, 1)}",
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12.0),
                  )),
              Container(
                width: 45.0,
                height: 45.0,
                margin: const EdgeInsets.only(right: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: (index == (appState.selectedDay) &&
                      appState.isDateHolderActive == true)
                      ? Border.all(width: 2.0, color: Theme.of(context).primaryColor)
                      : Border.all(color: Colors.transparent),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "${index + 1}", // to avoid showing zero
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          (appState.dayAvailabilityMap[index] ?? false)
              ? Positioned(right: 8.0, bottom: 5.0, child: activeBubble)
              : Container(),
        ],
      ),
    );
  }
}

//class CircleButtonHolder extends StatefulWidget {
//  CircleButtonHolder({
//    this.labelText,
//    this.holderIcon,
//    this.onTapFunction,
//    this.isActive = false,
//  });
//
//  final String labelText;
//  final IconData holderIcon;
//  final ValueChanged<String> onTapFunction;
//  final bool isActive;
//
//  @override
//  _CircleButtonHolderState createState() => _CircleButtonHolderState();
//}
//
//class _CircleButtonHolderState extends State<CircleButtonHolder> {
//
//  bool isActive;
//  bool isSelected;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  final Widget activeBubble = Container(
//    width: 15.0,
//    height: 15.0,
//    decoration: BoxDecoration(
//      shape: BoxShape.circle,
//      color: Colors.deepOrangeAccent,
//    ),
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    return InkWell(
//      onTap: () {
//        toggleDateHolderState(false);
//      },
//      child: Stack(
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              Container(
//                  margin: const EdgeInsets.only(right: 5.0),
//                  child: Text(
//                    widget.labelText,
//                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12.0),
//                  )),
//              Container(
//                width: 45.0,
//                height: 45.0,
//                margin: const EdgeInsets.only(right: 5.0),
//                decoration: BoxDecoration(
//                  shape: BoxShape.circle,
//                  color: Colors.white,
//                  border: isSelected
//                      ? Border.all(width: 2.0, color: Theme.of(context).primaryColor)
//                      : Border.all(color: Colors.transparent),
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Center(
//                    child: Icon(
//                      widget.holderIcon,
//                      size: 22.0,
//                      color: Theme.of(context).primaryColor,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          isActive
//              ? Positioned(right: 8.0, bottom: 5.0, child: activeBubble)
//              : Container(),
//        ],
//      ),
//    );
//  }
//}