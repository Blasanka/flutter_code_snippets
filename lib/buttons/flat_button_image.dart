import 'package:flutter/material.dart';

class ImageFlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'User info',
              ),
              Container(
                child: FlatButton(
                  child: getImageWidget(
                      "https://storage.googleapis.com/dev-dot-ai-project-ic.appspot.com/1/2019/03/demo.jpg"),
                  shape: new CircleBorder(),
                  onPressed: () {
                    print("Dont ever make setState async");
                  },
                ),
                width: 100.0,
                height: 100.0,
              ),
              RaisedButton(
                child: Text('Next'),
                onPressed: () {
                  print("tapped");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageWidget(imagePath) {
    if (imagePath == null || imagePath == "") {
      return buildCircularImage(AssetImage('assets/no_image.png'));
    } else {
      return buildCircularImage(NetworkImage(imagePath));
    }
  }

  Widget buildCircularImage(ImageProvider provider) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: provider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
