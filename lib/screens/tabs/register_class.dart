import 'package:flutter/material.dart';

class RegisterClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.search,
              size: 160.0,
              color: Colors.blue,
            ),
            new Text("授業登録画面")
          ],
        ),
      ),
    );
  }
}
