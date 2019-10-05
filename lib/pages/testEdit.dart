import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/pages/testList.dart';
import 'package:http/http.dart' as http;

class TestEdit extends StatefulWidget {

  final List list;
  final int index;
  TestEdit({this.list, this.index});

  @override
  _TestEditState createState() => _TestEditState();
}

class _TestEditState extends State<TestEdit> {

  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerLevel;

void editData(){
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
      appBar: AppBar(
        title: new Text("Editar"), backgroundColor: Colors.orange,
      ),
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
                      if(value.isEmpty) return "Ingrese un usuario";
                    },
                    decoration: new InputDecoration(
                      hintText: "Usuario", labelText: "Usuario", 
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.vpn_key, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerPassword,
                    validator: (value){
                      if(value.isEmpty) return "Ingrese una contraseña";
                    },
                    decoration: new InputDecoration(
                      hintText: "Contraseña", labelText: "Contraseña",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.local_activity, color: Colors.black,),
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
                  color: Colors.red,
                  onPressed: (){
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new TestList(),
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