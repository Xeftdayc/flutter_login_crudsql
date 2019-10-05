import 'package:flutter/material.dart';
import 'package:flutter_login_crudsql/pages/testList.dart';
//import 'other_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture =
      "https://pbs.twimg.com/profile_images/824458506589925381/nXVSSSeV_400x400.jpg";
  String otherProfilePicture =
      "https://pbs.twimg.com/profile_images/1963352163/MC_400x400.png";

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  String txtNombre;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Drawer App"),
        backgroundColor: Colors.redAccent,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Mc Core"),
                accountEmail: new Text("mctest@outlook.com"),
                currentAccountPicture: new GestureDetector(
                  onTap: () => print("This is the current user"),
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
                        image: new NetworkImage(
                            "https://t.ipadizate.es/2018/07/mac-os-wallpaper-640x336.jpg")))),
            new ListTile(
                title: new Text("Firts Page"),
                trailing: new Icon(Icons.arrow_upward),
                onTap: () => {/*
                      Navigator.of(context).pop(),
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new OtherPage("First Page")))
                    */}),
            new ListTile(
                title: new Text("Secund Page"),
                trailing: new Icon(Icons.arrow_right),
                onTap: () => {/*
                      Navigator.of(context).pop(),
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new OtherPage("First Page")))
                    */}),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new TestList()
      //child: new Text("HomePage", style: new TextStyle(fontSize: 35.0),),
    );
  }
}