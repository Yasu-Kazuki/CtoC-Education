import 'package:flutter/material.dart';

class ApprovalClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.people_outline,
              size: 160.0,
              color: Colors.blue,
            ),
            new Text("授業申請画面")
          ],
        ),
      ),
    );
  }
}
