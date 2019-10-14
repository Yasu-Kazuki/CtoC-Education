import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c2c_education/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CtoC Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CtoC Education'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 24.0),
            new TextFormField(
              controller: emailInputController,
              decoration: const InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 24.0),
            new TextFormField(
              controller: passwordInputController,
              decoration: new InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            new Center(
              child: new RaisedButton(
                child: const Text('Login'),
                onPressed: () {
                  var email = emailInputController.text;
                  var password = passwordInputController.text;
                  return _signIn(email, password)
                      .then((FirebaseUser user) => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())))
                      .catchError((e) => print(e));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // sign in method
  Future<FirebaseUser> _signIn(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }
}
