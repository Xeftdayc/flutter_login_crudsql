import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUsers extends StatefulWidget {
  @override
  _AddUsersState createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {

  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerLevel = new TextEditingController();

  var _formkey = GlobalKey<FormState>();

  void addUser(){
    var url = "http://192.168.1.103/mystore/addUser.php";

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "level": controllerLevel.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Add Users"), backgroundColor: Colors.pink,),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black,),
                    title: new TextFormField(
                      controller: controllerUsername,
                      validator: (value){
                        if(value.isEmpty) return "Input new User";
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
                        if(value.isEmpty) return "Input new Password";
                      },
                      decoration: new InputDecoration(
                        hintText: "Password", labelText: "Password",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.language, color: Colors.black,),
                    title: new TextFormField(
                      controller: controllerLevel,
                      validator: (value){
                        if(value.isEmpty) return "Input new Level";
                      },
                      decoration: new InputDecoration(
                        hintText: "Level", labelText: "Level",
                      ),
                    ),
                  ),
                  const Divider(height: 1.0),
                  new Padding(padding: const EdgeInsets.all(10.0),),
                  new RaisedButton(
                    child: new Text("Save"),
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: (){
                      if(_formkey.currentState.validate()){
                        addUser();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Exit"),
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/Dashboard');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}