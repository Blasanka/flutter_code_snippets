import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: ExampleScreen()));
}

class ExampleScreen extends StatefulWidget {
  ExampleScreen({Key key}) : super(key: key);

  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  List data = [];
  bool isLoading = true;

  void fetchData() async {
    final res = await http.get("https://jsonplaceholder.typicode.com/users");
    data = json.decode(res.body);
    setState(() => isLoading = false);
  }

  // this method invokes only when new route push to navigator
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(data?.toString() ?? ""),
      ),
    );
  }
}
