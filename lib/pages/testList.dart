import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/pages/testAdd.dart';
import 'package:flutter_login_crudsql/pages/testDetails.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class TestList extends StatefulWidget {
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {

  Future<List> getData() async {
    final response = await http.get("http://192.168.1.103/mystore/getUser.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Listado de usuario"), backgroundColor: Colors.orange,
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new TestAdd(),
          ));
        },
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
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
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new TestDetails(
                        list: list,
                        index: i,
                      ))),
              child: new Card(
                child: new ListTile(
                  title: new Text(
                    "${list[i]['username']}",
                    style: TextStyle(fontSize: 22.0, color: Colors.orangeAccent),
                  ),
                  leading: new Icon(Icons.person, size: 50.0, color: Colors.orangeAccent),
                  subtitle: new Text(
                    "level: ${list[i]['level']}",
                    style: TextStyle(fontSize: 17.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
