import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/models/listUsers.dart';
import 'package:flutter_login_crudsql/models/menuList.dart';
import 'package:flutter_login_crudsql/pages/homeMenu.dart';

import 'package:flutter_login_crudsql/pages/testHome.dart';
import 'package:flutter_login_crudsql/pages/testMenu.dart';


class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: new AppBar(title: Text("Dashboard"), backgroundColor: Colors.red,),
      body: new ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onDoubleTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new ListUsers(),
              )),
              child: new Card(
              child: ListTile(
                title: new Text("My Store", style: new TextStyle(fontSize: 20.0),),
                leading: new Icon(Icons.people, size: 50.0, color: Colors.red,),
                subtitle: new Text("Members in System"),
              ),
            ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              child: new Card(color: Colors.red,
                child: ListTile(
                  title: new Text("My Users", style: new TextStyle(fontSize: 20.0),),
                  leading: new Icon(Icons.store, size: 50.0, color: Colors.green,),
                  subtitle: new Text("System - Store"),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new ListUsers()
                  )),
                ),
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              child: new Card(color: Colors.cyan,
                child: ListTile(
                  title: new Text("My Testing", style: new TextStyle(fontSize: 20.0),),
                  leading: new Icon(Icons.memory, size: 50.0, color: Colors.orangeAccent,),
                  subtitle: new Text("Testing - Store"),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new HomeTest()
                  )),
                ),
              ),
            ),
          ),

          new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              child: Card(
                child: ListTile(
                  title: new Text("My Widgets", style: new TextStyle(fontSize: 20.0),),
                  leading: new Icon(Icons.mail_outline, size: 50.0, color: Colors.pink,),
                  subtitle: new Text("Testing Widgets"),
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/TestWidgets');
                  },
                ),
              ),
            ),
          ),
          
          RaisedButton(
            child: Text("Drawer"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/InstaHome');
            }
          ),
          RaisedButton(
            child: Text("MenuHamber"),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new HomePage()
            )),
          ),
          RaisedButton(
            child: Text("TestMenu"),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new TestMenu()
            )),
          ),
          RaisedButton(
            child: Text("Menu List"),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new MenuList()
            )),
          ),
          RaisedButton(
            child: Text("Salir"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/LoginPage');
            },
          )
        ],
      ),
    );
    
  }
}