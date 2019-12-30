import 'package:flutter/material.dart';

 void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter SO answers sample snippet',
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: Scaffold(
         body: Center(
           child: Text("There are separate directory for each code snippets which you can replace with this main.dart file"),
         ),
       ),
     );
   }
 }