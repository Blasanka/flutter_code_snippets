// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:so_answers/page_view_demos/simple_page_view.dart';
// import 'package:so_answers/storage_demos/save_shared_student_object.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter SO answers sample snippet',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(
//         todos: List.generate(
//           20, (i) => Todo(
//           'Todo $i',
//           'A description of what needs to be done for Todo $i',
//         ),
//         ),
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   @override
//   void initState() {
//     Map parentMap = {
//       'childOne': {
//         'grandSon': {
//           'grandGrandChild': {
//             'childOne': 'John',
//             'childTwo': 'Ron'
//           }
//         },
//         'grandDaughter': {
//           'grandGrandChild': {
//             'childOne': 'Lilly',
//             'childTwo': 'Sholin'
//           },
//         },
//       },
//       'childTwo': {
//         'grandSon': {'childOne': 'Charly'}
//       }
//     };

//     Map newMap = {
//       'childOne': {
//         'grandSon': {
//           'grandGrandChild': {
//             'childOne': 'John',
//             'childTwo': 'Ron'
//           }
//         }
//       }
//     };

//     Map tempParentMap = Map.from(parentMap);
//     tempParentMap.forEach((key, value) {
//       if (newMap.containsKey(key)) {
//         parentMap.addAll(newMap[key]);
//       }
//     });
//     print(parentMap);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(child: Overlay(initialEntries: [
//         OverlayEntry(builder: (_) => Image.network("https://source.unsplash.com/random", fit: BoxFit.cover,)),
//         OverlayEntry(builder: (_) => Center(child: Text("Overlay", style: TextStyle(color: Colors.yellow),))),
//       ])),
//     );
//   }
// }

