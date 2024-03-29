import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/models/menuList.dart';
import 'package:flutter_login_crudsql/pages/homeInsta.dart';
import 'package:flutter_login_crudsql/pages/testList.dart';
import 'package:flutter_login_crudsql/pages/testPower.dart';
import 'package:flutter_login_crudsql/pages/testAdd.dart';
import 'package:flutter_login_crudsql/pages/testWidgets.dart';

import './models/Dashboard.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

String username = '';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRUD + Login",
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/testPower': (BuildContext context) => new TestPower(),
        '/Dashboard': (BuildContext context) => new Dashboard(),
        '/MenuList': (BuildContext context) => MenuList(),
        '/LoginPage': (BuildContext context) => LoginPage(),
        '/InstaHome': (BuildContext context) => InstaHome(),
        '/TestWidgets': (BuildContext context) => TestWidgets(),
        '/pages/testList': (BuildContext context) => TestList(),
        '/pages/testAdd': (BuildContext context) => TestAdd(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';

  Future<List> login() async {
    final response = await http.post("http://192.168.1.103/mystore/login.php", body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensaje = "Usuario o Contraseña incorrecta";
      });
    } else {
      if(datauser[0]['level'] == 'admin'){
        Navigator.pushReplacementNamed(context, '/MenuList');
      }else if (datauser[0]['level'] == 'member'){
        Navigator.pushReplacementNamed(context, '/testPower');
        //print("Usuario member conectado");
      }
      setState(() {
        username = datauser[0]['username'];
      });
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/digital.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 77.0),
                child: new CircleAvatar(
                  backgroundColor: Color(0xF81F7F3),
                  child: new Image(
                    width: 135,
                    height: 135,
                    image: new AssetImage("assets/images/avatar7.png"),
                  ),
                ),
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 93),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: controllerUser,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email, color: Colors.black),
                            hintText: 'Username'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key, color: Colors.black),
                            hintText: 'Password'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6, right: 32),
                        child: Text(
                          "Recordar Password",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Spacer(),
                    new RaisedButton(
                      child: new Text("Ingresar"),
                      color: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        login();
                        //Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    Text(mensaje, style: TextStyle(fontSize: 25.0, color: Colors.red))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
