import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);

  Todo.fromJson(Map<String, dynamic> map) :
        title = map["title"],
        description = map["description"];

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description
  };
}

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: HomePage(
      todos: List.generate(
        20, (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i',
        ),
      ),
    ),
  ));
}

class HomePage extends StatelessWidget {
  final List<Todo> todos;

  HomePage({this.todos}) {
    saveTodos();
  }

  void saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> values =  todos.map((item) => json.encode(item.toMap())).toList();
    prefs.setStringList("todos", values);
  }

  @override
  Widget build(BuildContext context) {
    return TodosScreen();
  }
}


class TodosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateTodosScreen();
  }
}

class _StateTodosScreen extends State<TodosScreen> {

  Future<List<Todo>> getTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> values = prefs.getStringList("todos");
    return values.map((item) => Todo.fromJson(json.decode(item))).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: FutureBuilder(
        future: getTodos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(todo: snapshot.data[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}