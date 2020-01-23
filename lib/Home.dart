import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert'; //agar bisa memakai json.decode
import 'MenuGrid.dart';
import 'WebView.dart'; //agar bisa memakai Custom Widget Grid

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.web),
                onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WebViewPage();
                    }))),
                    IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () => Navigator.pushNamed(context, 'userlist'),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.doorOpen),
                      onPressed: () => Navigator.pushNamed(context, 'login'),
                    ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/simple.json"),
            builder: (context, snapshot){
              var user = json.decode(snapshot.data.toString());
              return GridView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return SingleMenuGrid(
                      namaItem: user[index]['name'],
                      harga: user[index]['city'],
                      warna: Colors.green[700],
                      umur: user[index]['age'],
                    );
                  },
                  itemCount: user.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                
              );
            },
          ),
          // child: FutureBuilder(
          //     future: DefaultAssetBundle.of(context)
          //         .loadString("assets/simple.json"),
          //     builder: (context, snapshot) {
          //       var user = json.decode(snapshot.data.toString());
          //       return GridView.builder(
          //         itemBuilder: (BuildContext context, int index) {
          //           return SingleMenuGrid(
          //             namaItem: user[index]['name'],
          //             harga: user[index]['city'],
          //             warna: Colors.green[700],
          //             umur: user[index]['age'],
          //           );
          //         },
          //         itemCount: user.length,
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 3),
          //       );
          //     }),
        ));
  }
}