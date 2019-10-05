import 'package:flutter/material.dart';

class TestPower extends StatefulWidget {
  @override
  _TestPowerState createState() => _TestPowerState();
}

class _TestPowerState extends State<TestPower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Pagina Power"),
      ),
      body: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/pages/listarUsuarios');
                  },
                  child: new Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/pages/listarUsuarios');
                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/pages/listarUsuarios');
                  },
                  child: new  Icon(
                    Icons.settings,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/pages/listarUsuarios');
                  },
                  child: new Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/pages/listarUsuarios');
                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/LoginPage');
                  },
                  child: new Icon(
                    Icons.exit_to_app,
                    color: Colors.redAccent,
                    size: 73.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
