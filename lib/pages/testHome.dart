import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/pages/testDetails.dart';

import 'package:flutter_login_crudsql/models/addUsers.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';


class HomeTest extends StatefulWidget {
  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {

  Future<List> getData() async {
    final response = await http.get("http://192.168.1.103/mystore/getUser.php");
    return json.decode(response.body);
  } 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Home Test")),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add_alarm),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddUsers()
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                list: snapshot.data,
              )
              : new Center(
                child: new CircularProgressIndicator(),
              );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new  MaterialPageRoute(
              builder: (BuildContext context) => new TestDetails(list: list, index: i,)
            )),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['username']),
                leading: new Icon(Icons.wallpaper),
                subtitle: new Text("level: ${(list[i]['level'])}"),
              ),
            ),
          ),
        );
      },
      
    );
  }
}

/*
class TestPUB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text("Pagina Ventas"),),
      body: new Column(
        children: <Widget>[
          new Text("Estamos en ventas"),
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
}*/