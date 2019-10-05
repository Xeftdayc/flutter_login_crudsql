import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/models/Dashboard.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  String mainProfilePicture = "https://pbs.twimg.com/profile_images/824458506589925381/nXVSSSeV_400x400.jpg";
  String otherProfilePicture = "https://pbs.twimg.com/profile_images/1963352163/MC_400x400.png";

  void switchUser(){
    String backupString = mainProfilePicture;
    this.setState((){
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  String txtNombre;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Dashboard"), backgroundColor: Colors.redAccent,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Mc Core"),
              accountEmail: new Text("mctest@outlook.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is the current User"),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => switchUser(),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(otherProfilePicture),
                  ),
                )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://t.ipadizate.es/2018/07/mac-os-wallpaper-640x336.jpg")
                )
              ),
            ),
            new ListTile(
              title: new Text("Firts Page"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: (null),
            ),
            new ListTile(
              title: new Text("Secund Page"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){},
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: (){
                Navigator.popAndPushNamed(context, '/Dashboard');
              },
            )
          ],
        ),
      ),
      body: Dashboard(),
      //bottomNavigationBar: TopBar(),
    );
  }
}