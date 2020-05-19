import 'package:flutter/material.dart';

class FloatingImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("button tapped"),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
              image: NetworkImage("https://storage.googleapis.com/dev-dot-ai-project-ic.appspot.com/1/2019/03/demo.jpg"),
            fit: BoxFit.cover
          ),
          ),
        ),
        ),
    );
  }
}
