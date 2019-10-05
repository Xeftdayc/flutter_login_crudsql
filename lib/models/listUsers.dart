import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './detailUsers.dart';
import './addUsers.dart';

import 'dart:async';
import 'dart:convert';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  Future<List> getData() async {
    final response = await http.get("http://192.168.1.103/mystore/getUser.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("List Users"), backgroundColor: Colors.pink,),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new AddUsers()
          ));
        },
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
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DetailUsers(
                list: list,
                index: i,
              ))),
              child: new Card(
                child: new ListTile(
                  title: new Text(
                    "${list[i]['username']}",
                    style: TextStyle(fontSize: 22.0, color: Colors.cyan, fontWeight: FontWeight.bold),
                  ),
                  leading: new Icon(Icons.people, size: 50.0, color: Colors.pink,),
                  subtitle: new Text(
                    "Level: ${list[i]['level']}",
                    style: TextStyle(fontSize: 17.0, color: Colors.black,),
                  ),
                ),
              ),
          ),
        );
      },
    );
  }
}