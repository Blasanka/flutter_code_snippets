import 'package:flutter/material.dart';

class SimplePageView extends StatefulWidget {
  @override
  _SimplePageViewState createState() => _SimplePageViewState();
}

class _SimplePageViewState extends State<SimplePageView> {
  PageController _pageController = PageController();

  String selectedDate;

  String day = "0";

  Widget _days(int week) {
    int index = week;
    var now = DateTime.now();
    var currentDate = now.day;
    var year = now.year;
    var date = DateTime(year, index + 1).subtract(Duration(days: 1)).day;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          for (int i = 1; i < 8; i++)
            InkWell(
              onTap: () {
                  String slectedMonth;
                  if (index < 10) {
                    slectedMonth = '0$index';
                  }
                  String tapDate = (i + (week * 7)).toString();
                  setState(() {
                    day = tapDate;
                  });
                  if (int.tryParse(tapDate) < 10) {
                    tapDate = '0$tapDate';
                  }
                  setState(() {
                    selectedDate = '$year-$slectedMonth-$tapDate';
                  });
                },
              child: Container(
                decoration: BoxDecoration(
                  color: ("${((week * 7) + i)}" == day) ? Color(0xFF55555+i) : null,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12.0),
                child: ((week * 7) + i) == currentDate
                      ? Container(
                    child: Text(
                      ((week * 7) + i) < date
                          ? ((week * 7) + i).toString() + ""
                          : '',
                      style: TextStyle(),
                    ),
                  )
                      : Text(
                    ((week * 7) + i) < date
                        ? ((week * 7) + i).toString() + " "
                        : '',
                    style: TextStyle(),
                  ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: 50,
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            _days(0),
            _days(1),
            _days(2),
            _days(3),
            _days(4),
          ],
        ),
      ),
    );
  }
}
