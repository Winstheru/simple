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
  // String _username = "";
  // String _password = "";
  String _kota = "";

  User user = new User("", "", "", "");
  String username;
  String password;
  String emailId;
  String mobileNo;

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

  final List<String> choices = ["Medan", "Jakarta", "Bandung"];

  @override
  Widget build(BuildContext context) {
    final _form = _formKey.currentState;
    _onRegisterPressed() {
      if (_form.validate()) {
        _form.save();

        var user = User(username, password, mobileNo, emailId);
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
        // Future.delayed(Duration(seconds: 2), () {
        //   Navigator.pushNamed(context, 'login');
        // });
      } else {
        print("data belum terisi");
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("REGISTER"),
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
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.green,
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) =>
                            value.length == 0 ? "Enter Password" : null,
                        onSaved: (value) => this.password = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.mobileAlt,
                              color: Colors.green,
                            ),
                            labelText: "Mobile Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) =>
                            value.length == 0 ? "Enter Mobile Number" : null,
                        onSaved: (value) => this.mobileNo = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                            labelText: "Email Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        validator: (value) =>
                            value.length == 0 ? "Enter Email Address" : null,
                        onSaved: (value) => this.emailId = value,
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(
                      //         Icons.lock,
                      //         color: Colors.green,
                      //       ),
                      //       labelText: "Username",
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       )),
                      //   validator: (value) {
                      //     if (value.isEmpty) {
                      //       return "Masukkan username";
                      //     }
                      //   },
                      //   onSaved: (value) => _username = value,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   obscureText:
                      //       hide, //obscureText jika bernilai TRUE akan menutup password yang diketik
                      //   decoration: InputDecoration(
                      //       suffixIcon: IconButton(
                      //         icon: hide ? icon1 : icon2,
                      //         onPressed: () {
                      //           setState(() {
                      //             hide =
                      //                 !hide; //jika icon mata ditekan maka show text password
                      //           });
                      //         },
                      //       ),
                      //       labelText: "Password",
                      //       hintText: "Masukkan password",
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10))),
                      //   onSaved: (value) => _password = value,
                      //   validator: (value) {
                      //     if (value.isEmpty) {
                      //       return "Masukkan password terlebih dahulu";
                      //     }
                      //   },
                      // ),
                      // Container(
                      //     margin: EdgeInsets.only(top: 16),
                      //     padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.green, width: 2),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: DropdownButtonHideUnderline(
                      //       child: DropdownButton(
                      //         style:
                      //             TextStyle(fontSize: 18, color: Colors.blue),
                      //         items: choices
                      //             .map((value) => DropdownMenuItem(
                      //                   child: Text(value),
                      //                   value: value,
                      //                 ))
                      //             .toList(),
                      //         hint: Text(_kota, style: TextStyle(fontSize: 18)),
                      //         onChanged: (String value) {
                      //           setState(() {
                      //             _kota = value;
                      //           });
                      //         },
                      //       ),
                      //     )),
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
