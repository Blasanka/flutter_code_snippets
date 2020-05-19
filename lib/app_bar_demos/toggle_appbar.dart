import 'package:flutter/material.dart';

class ToggleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: Visibility(
          visible: true,
          child: AppBar(),
        ),
      ),
      body: Container(color: Colors.red),
    );
  }
}
