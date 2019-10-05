import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/pages/testMenu.dart';

class TopBar extends StatelessWidget {

  final topBar = new AppBar(
    backgroundColor: Colors.cyan,
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera),
    title: SizedBox(
      height: 35.0, child: Image.asset("assets/images/avatar7.png"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: new ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          RaisedButton(
            child: Text("TestMenu"),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new TestMenu()
            )),
          ),
        ],
      )
    );
  }
}