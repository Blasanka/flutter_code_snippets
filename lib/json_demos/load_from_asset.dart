
//@formatter:off
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:so_answers/utility_demos/user_management/database_helper.dart';
import 'package:so_answers/utility_demos/user_management/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> doLogin() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/login_mock_data.json");
    final decoded = json.decode(data);
    try {
      if (decoded != null) {
        final user = User.fromJson(decoded["loginUser"]);
        DatabaseHelper dbHelper = new DatabaseHelper();
        await dbHelper.saveUser(user);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  Future<String> getLoggedInUser() async {
    await DatabaseHelper().deleteUser();
    bool isLoggedIn = await doLogin();
    if (isLoggedIn) {
      User user = await DatabaseHelper().getUser();
      return user.getToken;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Icon(
              Icons.access_time,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.yellow,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
//      FloatingImageButton();
//      FutureBuilder(
//        future: getLoggedInUser(),// this is also not a good practice :D, since each and every time build method execute this will invoke too.
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          if (snapshot.hasError) {
//            return Center(child: Text("Something..."));
//          } else if (snapshot.hasData) {
//            // just to show you how to fetch from db
//            if (snapshot.data != null) {
//              return Center(child: Text("Logged in token: ${snapshot.data}"));
//            }
//            return Center(child: Text("Not logged in"));
//          }
//          return Center(child: CircularProgressIndicator());
//        },
//      ),
//    );
  }
}
