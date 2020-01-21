import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //agar bisa memakai json.decode
import 'MenuGrid.dart'; //agar bisa memakai Custom Widget Grid

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
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/simple.json"),
              builder: (context, snapshot) {
                // var user = json.decode(snapshot.data.toString());
                var user = jsonDecode(snapshot.data.toString());
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
              }),
        ));
  }
}
