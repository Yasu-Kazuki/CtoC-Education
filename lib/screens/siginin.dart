import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c2c_education/screens/home.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailInputController = new TextEditingController();
  final passwordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: emailInputController,
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: passwordInputController,
                decoration: new InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40.0),
              child: new RaisedButton(
                child: const Text('Login'),
                color: Colors.blue,
                shape: StadiumBorder(),
                textColor: Colors.white,
                onPressed: () {
                  var email = emailInputController.text;
                  var password = passwordInputController.text;
                  return _signIn(email, password)
                      .then((FirebaseUser user) => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())))
                      .catchError((e) => showDialog(context: context, builder: (_) {
                    return AlertDialog(
                      title: Text("ログインエラー"),
                      content: Text("ログインに失敗しました。"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Cancel"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );},
                  ));
                },
              ),
            ),
            Text(
              '~Team sayabusa presents~',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0
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
