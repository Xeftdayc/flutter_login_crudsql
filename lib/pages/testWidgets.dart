import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TestWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: Drawer(),
      appBar: AppBar(
        title: new Image( height: 40.0,
          image: new NetworkImage("https://pbs.twimg.com/profile_images/1963352163/MC_400x400.png"),
        ),
        actions: <Widget>[
          Icon(Icons.search),
          InkWell(
            onTap: () {
              print("Hello World!");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.dehaze),
            ),
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Sigue estudiando",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              )),
          Container(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 200.0,
                    height: 150.0,
                    color: Colors.pink,
                    child: Text("Posicion: $position", style: TextStyle(color: Colors.yellow),),
                  ),
                );
              },
            ),
          ),
          /*
          Container(
            height: 150.0,
            //padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, position){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(color: Colors.cyan,
                    child: ListTile(
                      title: new Text("Posicion: $position", style: new TextStyle(fontSize: 20.0),),
                      leading: new Icon(Icons.desktop_windows, size: 50.0, color: Colors.purple,),
                      subtitle: new Text("Test Posicion"),
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/Dashboard');
                      },
                    ),
                  ),
                );
              },
            ),
          ),*/
          DefaultTabController(
            length: 3,
            child: TabBar(
              unselectedLabelColor: Colors.red,
              indicatorColor: Colors.black,
              labelColor: Colors.yellow,            
              tabs: <Widget>[
                Tab(text: "Cursos",),
                Tab(text: "Workshops",),
                Tab(text: "Especialidades",),
              ],
            ),
          ),
        ],
      ),

      /*
      body: new ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("Salir"),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MenuList');
            },
          )
        ],
      )*/
    );
  }
}
