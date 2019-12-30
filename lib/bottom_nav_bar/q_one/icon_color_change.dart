import 'package:flutter/material.dart';
import 'package:so_answers/bottom_nav_bar/q_one/bottom_nav.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Material(color: Colors.black87, child: Column(
            children: <Widget>[
              Container(
                height: 80,
                color: Colors.blue,
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),),
          Material(color: Colors.redAccent),
          Material(color: Colors.red),
          Material(color: Colors.greenAccent),
          Material(color: Colors.green),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavBar(
        backgroundColor: Colors.pink,
        selectedIndex: _currentTab,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentTab = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease
          );
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('One'),
            activeColor: Colors.deepPurple,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Two'),
            activeColor: Colors.deepPurple,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Three'),
            activeColor: Colors.deepPurple,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Four'),
            activeColor: Colors.deepPurple,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Five'),
            activeColor: Colors.red,
            inactiveColor: Colors.deepPurple
          ),
        ],
      ),
    );
  }
}