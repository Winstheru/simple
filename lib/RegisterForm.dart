import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _username = "";
  String _password = "";
  String _kota = "";

  bool hide = true;
  Icon icon1 = Icon(
    FontAwesomeIcons.eye,
    color: Colors.green,
  );
  Icon icon2 = Icon(
    FontAwesomeIcons.eyeSlash,
    color: Colors.grey,
  );

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final List<String> choices = ["Medan", "Jakarta", "Bandung"];

  @override
  Widget build(BuildContext context) {
    var form = formKey.currentState;
    _onRegisterPressed() {
      form.validate();
      if (form.validate()) {
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
        form.save();
        Future.delayed(Duration(seconds: 2), () {
        Navigator.popAndPushNamed(context, 'login');
      });
      } else {
        print("belum memasukkan username atau password");
      }
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("REGISTER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Masukkan username";
                    }
                  },
                  onSaved: (value) => _username = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText:
                      hide, //obscureText jika bernilai TRUE akan menutup password yang diketik
                  decoration: InputDecoration(
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
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Masukkan password terlebih dahulu";
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.fromLTRB(8,0,8,0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                        items: choices
                            .map((value) => DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                ))
                            .toList(),
                        hint: Text(_kota, style: TextStyle(fontSize: 18)),
                        onChanged: (String value) {
                          setState(() {
                            _kota = value;
                          });
                        },
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
                )
              ],
            )),
      ),
    );
  }
}
