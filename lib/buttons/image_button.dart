import 'package:flutter/material.dart';

class CircleImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("you have tapped on image"),
      child: CircleAvatar(
        backgroundImage: NetworkImage("https://storage.googleapis.com/dev-dot-ai-project-ic.appspot.com/1/2019/03/demo.jpg"),
      ),
    );
  }
}
