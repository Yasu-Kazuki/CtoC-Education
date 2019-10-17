import 'package:c2c_education/screens/siginin.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CtoC Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(title: 'CtoC Education'),
    );
  }
}

