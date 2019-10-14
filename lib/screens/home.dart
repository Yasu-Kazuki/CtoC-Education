import 'package:c2c_education/models/usr_entry.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:c2c_education/models/contents_entry.dart';

// home screen
class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final _contentsReference = FirebaseDatabase.instance.reference().child("contentsID");
  final _userReference = FirebaseDatabase.instance.reference().child("userID");

  // contents entries
  List<ContentsEntry> contentsEntries = new List();

  // user entries
  List<UserEntry> userEntries = new List();

  @override
  initState() {
    super.initState();
    _contentsReference.onChildAdded.listen(_onContentsEntryAdded);
    _userReference.onChildAdded.listen(_onUserEntryAdded);

    _contentsReference.once().then((DataSnapshot snapShot) {
      contentsEntries.add(new ContentsEntry.fromSnapShot(snapShot));
    });

    _userReference.once().then((DataSnapshot snapShot) {
      userEntries.add(new UserEntry.fromSnapShot(snapShot));
    });
  }


  _onContentsEntryAdded(Event e) {
    setState(() {
      contentsEntries.add(new ContentsEntry.fromSnapShot(e.snapshot));
    });
  }

  _onUserEntryAdded(Event e) {
    setState(() {
      userEntries.add(new UserEntry.fromSnapShot(e.snapshot));
    });
  }


  // screen build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text("Contents")
      ),
      body: Container(
          child: new Column(
            children: <Widget>[
              Expanded(
                child:
                ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildRow(index);
                  },
                  itemCount: contentsEntries.length-1,
                ),
              )
            ],
          )
      ),
    );
  }

  // contents row
  Widget _buildRow(int index) {
    return Card(
        child: ListTile(
            title: Text(contentsEntries[index].title),
            subtitle: Text("講師：" + getTeacherName(contentsEntries[index].teacherId))
        )
    );
  }

  // get teacher name
  String getTeacherName(String id){
    for(UserEntry user in userEntries) {
      if(id == user.id){
        return user.name;
      }
    }

    return "unknown";
  }
}