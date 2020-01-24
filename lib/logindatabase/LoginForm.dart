import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginDatabase extends StatefulWidget {
  @override
  _LoginDatabaseState createState() => _LoginDatabaseState();
}

class _LoginDatabaseState extends State<LoginDatabase> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response =
        await http.post("http://192.168.43.56/user/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    print(response.body);

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      Navigator.pushReplacementNamed(context, 'home');
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login dengan Database"),),
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
            RaisedButton(
              child: Text("Login"),
              onPressed: () {
                _login();
              },
            ),
            Text(
              msg,
              style: TextStyle(fontSize: 20.0, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
