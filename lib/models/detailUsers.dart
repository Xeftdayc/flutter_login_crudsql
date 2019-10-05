import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './listUsers.dart';
import './editUsers.dart';

class DetailUsers extends StatefulWidget {

  final List list;
  final int index;
  DetailUsers({this.index,this.list});
  @override
  _DetailUsersState createState() => _DetailUsersState();
}

class _DetailUsersState extends State<DetailUsers> {

  void deleteData(){
    var url="http://192.168.1.103/mystore/deleteUser.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id']
    });
  }

  void confirmData(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are delete you okay! '${widget.list[widget.index]['username']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Ok confirmed!", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new ListUsers()
            ));
          },
        ),
        new RaisedButton(
          child: new Text("Cancelar", style: new TextStyle(color: Colors.black),),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("${widget.list[widget.index]['username']}"), backgroundColor: Colors.pink,),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['username'], style: new TextStyle(color: Colors.purple, fontSize: 25.0),),
                Divider(),
                new Text("Username: ${widget.list[widget.index]['username']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Password: ${widget.list[widget.index]['password']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Level: ${widget.list[widget.index]['level']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 10.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("Edit"),
                      color: Colors.green,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                      ),
                      onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditUsers(list: widget.list, index: widget.index,),
                      )),
                    ),
                    VerticalDivider(),
                    new RaisedButton(
                      child: new Text("Delete"),
                      color: Colors.red,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                      ),
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