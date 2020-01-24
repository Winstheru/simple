import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterDatabase extends StatefulWidget {
  @override
  _RegisterDatabaseState createState() => _RegisterDatabaseState();
}

class _RegisterDatabaseState extends State<RegisterDatabase> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String _city = "";
  String city;
  String _choosenCity;
  final List<String> kota = ["Medan", "Jakarta", "Bandung"];

  void addUser(){
    var url = "http://192.168.43.56/user/add.php";
    http.post(url, body: {
      "username": user.text,
      "password": pass.text,
      "city": _choosenCity
    }).then((response){
      if(response.statusCode == 200){
        Flushbar(
          icon: Icon(
            Icons.info_outline,
            color: Colors.blue[900],
          ),
          messageText: Text(
            "User berhasil di register",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        )..show(context);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, 'login');
        });
      }else{
        Flushbar(
          icon: Icon(
            Icons.info_outline,
            color: Colors.blue[900],
          ),
          messageText: Text(
            "${response.body}",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        )..show(context);
      }
      print("${response.statusCode}");
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register dengan Database"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: user,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: pass,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            Container(
              
                          margin: EdgeInsets.only(top: 16),
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                              items: kota
                                  .map((value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ))
                                  .toList(),
                              hint: Text(_city, style: TextStyle(fontSize: 18)),
                              onChanged: (String value) {
                                setState(() {
                                  _choosenCity = value;
                                });
                              },
                              value: _city == null
                                  ? null
                                  :  city= _choosenCity,
                            ),
                          )
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {
                addUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
