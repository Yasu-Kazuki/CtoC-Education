import 'package:c2c_education/common/pop_menu_choice.dart';
import 'package:c2c_education/screens/tabs/approval_class.dart';
import 'package:c2c_education/screens/tabs/register_class.dart';
import 'package:c2c_education/screens/tabs/search_class.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      tabs: <Tab>[
        new Tab(
          icon: new Icon(Icons.create),
            child: Text('授業検索')
        ),
        new Tab(
          icon: new Icon(Icons.search),
            child: Text('授業登録')
        ),
        new Tab(
            icon: new Icon(Icons.people_outline),
            child: Text('授業申請')
        )
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("コンテンツ"),
            actions: <Widget>[
              PopupMenuButton<PopMenuChoice>(
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return choices.map((PopMenuChoice choice) {
                    return PopupMenuItem<PopMenuChoice>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              ),
            ],
            backgroundColor: Colors.blue,
            bottom: getTabBar()),
        body: getTabBarView(<Widget>[new SearchClass(), new RegisterClass(), new ApprovalClass()]));
  }

  void _select(PopMenuChoice choice) {
    // do nothing
  }
}