import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './User.dart';
import './database/dbhelper.dart';

import 'ContainerWH.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _city = "";

  User user = new User("", "", "");
  String username;
  String password;
  String city;

  bool hide = true;
  Icon icon1 = Icon(
    FontAwesomeIcons.eye,
    color: Colors.green,
  );
  Icon icon2 = Icon(
    FontAwesomeIcons.eyeSlash,
    color: Colors.grey,
  );

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String _choosenCity;
  final List<String> kota = ["Medan", "Jakarta", "Bandung"];

  @override
  Widget build(BuildContext context) {
    final _form = _formKey.currentState;
    _onRegisterPressed() {
      if (_form.validate()) {
        _form.save();

        var user = User(username, password, city);
        var dbHelper = DBHelper();
        dbHelper.saveUser(user);
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
      } else {
        print("data belum terisi semua");
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("REGISTER USER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ContainerWH(
          Center(
              child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) =>
                            value.length == 0 ? "Enter Username" : null,
                        onSaved: (value) => this.username = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText:
                            hide, //obscureText jika bernilai TRUE akan menutup password yang diketik
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                            suffixIcon: IconButton(
                              icon: hide ? icon1 : icon2,
                              onPressed: () {
                                setState(() {
                                  hide =
                                      !hide; //jika icon mata ditekan maka show text password
                                });
                              },
                            ),
                            labelText: "Password",
                            hintText: "Masukkan password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onSaved: (value) => this.password = value,
                        validator: (value) => value.length == 0 ? "Masukkan password terlebih dahulu" : null,
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
                                  : this.city = _choosenCity,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: FlatButton(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          onPressed: _onRegisterPressed,
                        ),
                      ),
                    ],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
