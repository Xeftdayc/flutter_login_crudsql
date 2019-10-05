import 'package:flutter/material.dart';

import './listUsers.dart';

import 'package:http/http.dart' as http;

class EditUsers extends StatefulWidget {

  final List list;
  final int index;
  EditUsers({this.list, this.index});

  @override
  _EditUsersState createState() => _EditUsersState();
}

class _EditUsersState extends State<EditUsers> {

  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerLevel;

void editUser(){
  var url="http://192.168.1.103/mystore/editUser.php";
  http.post(url, body: {
    "id": widget.list[widget.index]['id'],
    "username": controllerUsername.text,
    "password": controllerPassword.text,
    "level": controllerLevel.text,
  });
}

@override
  void initState() {
    controllerUsername = new TextEditingController(text: widget.list[widget.index]['username']);
    controllerPassword = new TextEditingController(text: widget.list[widget.index]['password']);
    controllerLevel = new TextEditingController(text: widget.list[widget.index]['level']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Editar"), backgroundColor: Colors.pink,),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerUsername,
                    validator: (value){
                      if(value.isEmpty) return "Input text User";
                    },
                    decoration: new InputDecoration(
                      hintText: "User", labelText: "User", 
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.vpn_key, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerPassword,
                    validator: (value){
                      if(value.isEmpty) return "Input text Password";
                    },
                    decoration: new InputDecoration(
                      hintText: "Password", labelText: "Password",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.local_activity, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerLevel,
                    validator: (value){
                      if(value.isEmpty) return "Input text Level";
                    },
                    decoration: new InputDecoration(
                      hintText: "Level", labelText: "Level",
                    ),
                  ),
                ),
                const Divider(height: 1.0,),
                new Padding(padding: const EdgeInsets.all(10.0),),
                new RaisedButton(
                  child: new Text("Save"),
                  color: Colors.red,
                  onPressed: (){
                    editUser();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new ListUsers(),
                      )
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}