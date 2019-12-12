import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:so_answers/drop_down/add_api_data/model.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  List<DataModel> _list = [];
  DataModel _selectedMenuItem;

  String selected = "hello";

  Future<List<DataModel>> loadJsonFromAsset() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    final decoded = json.decode(data);
    try {
      return (decoded != null)
          ? decoded["data"]
              .map<DataModel>((item) => DataModel.fromJson(item))
              .toList()
          : [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future initJson() async {
    _list = await loadJsonFromAsset();

    if (_list.length > 0) {
      _selectedMenuItem = _list[0];
    }
  }

  DropdownMenuItem<DataModel> buildDropdownMenuItem(DataModel item) {
    return DropdownMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(item.name ?? ""),
      ),
    );
  }

  Widget buildDropdownButton() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: DropdownButton<DataModel>(
          elevation: 1,
          hint: Text("Select one"),
          isExpanded: true,
          underline: Container(
            height: 2,
            color: Colors.black12,
          ),
          items: _list.map((item) => buildDropdownMenuItem(item)).toList(),
          value: _selectedMenuItem,
          onChanged: (DataModel item) {
            setState(() => _selectedMenuItem = item);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    initJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildDropdownButton(),
    );
  }
}
