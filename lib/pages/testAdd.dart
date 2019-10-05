import 'package:flutter/material.dart';
//import './listarUsuarios.dart';
import 'package:http/http.dart' as http;

class TestAdd extends StatefulWidget {
  @override
  _TestAddState createState() => _TestAddState();
}

class _TestAddState extends State<TestAdd> {

  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerLevel = new TextEditingController();

  var _formkey = GlobalKey<FormState>();

  void addData(){
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
      appBar: AppBar(
        title: new Text("Agregar Usuarios"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                      validator: (value){
                        if(value.isEmpty) return "Ingrese un Usuario";
                      },
                      decoration: new InputDecoration(
                        hintText: "Usuarios", labelText: "Usuario",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.vpn_key, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPassword,
                      validator: (value){
                        if(value.isEmpty) return "Ingrese un Password";
                      },
                      decoration: new InputDecoration(
                        hintText: "Password", labelText: "Password",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.list, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerLevel,
                      validator: (value){
                        if(value.isEmpty) return "Ingrese un Level";
                      },
                      decoration: new InputDecoration(
                        hintText: "Level", labelText: "Level",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Guardar"),
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: (){
                      if(_formkey.currentState.validate()){
                        addData();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/testPower');
                    },
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}