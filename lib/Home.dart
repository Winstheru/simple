import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; //agar bisa memakai json.decode
import 'MenuGrid.dart'; //agar bisa memakai Custom Widget Grid

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime currentBackPressTime;
  Future<bool> _backButtonPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Flushbar(
        message: "Tekan lagi untuk keluar",
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: WillPopScope(
        onWillPop: _backButtonPressed,
          child: Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/simple.json"),
            builder: (context, snapshot) {
              var user = json.decode(snapshot.data.toString());
              return user.length > 0
                  ? //jika terdapat data maka muncul widget dibawah
                  GridView.builder(
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
                    )
                  : Center(
                      child: Text("Tidak ada data"),
                    ); //jika json kosong akan muncul ini
            }),
      )),
    );
  }
}
