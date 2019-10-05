import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_login_crudsql/pages/testEdit.dart';
import 'package:flutter_login_crudsql/models/Dashboard.dart';

class TestDetails extends StatefulWidget {

  final List list;
  final int index;
  TestDetails({this.index,this.list});

  @override
  _TestDetailsState createState() => _TestDetailsState();
}

class _TestDetailsState extends State<TestDetails> {

  void deleteData(){
    var url="http://192.168.1.103/mystore/deleteUser.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id']
    });
  }

  void confirmData(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure want to delete '${widget.list[widget.index]['usurname']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("OK DELETE!", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Dashboard()
            ));
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['username']}"),backgroundColor: Colors.orange,),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['username'], style: new TextStyle(color: Colors.purple, fontSize: 25.0),),
                new Text("Username: ${widget.list[widget.index]['username']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Password: ${widget.list[widget.index]['password']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Level: ${widget.list[widget.index]['level']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 10.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new TestEdit(list: widget.list, index: widget.index,),
                      )),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: () => confirmData(),
                    )
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}