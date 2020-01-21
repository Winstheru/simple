import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple/ContainerWH.dart';

bool hide = true;
Icon _icon = Icon(
  //kalau pake underscore sebelum nama_variable berarti itu private variable
  FontAwesomeIcons.eye,
  color: Colors.grey,
);
Icon _icon2 = Icon(
  FontAwesomeIcons.eyeSlash,
  color: Colors.grey,
);

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

String _username = "";
String _password = "";

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>(); //utk akses Form_State
  final mainKey = GlobalKey<ScaffoldState>();

  @override
  @override
  Widget build(BuildContext context) {
    var form = formKey.currentState;
    _onLoginButtonPressed() {
      form.validate();
      if (form.validate()) {
        form.save();
        Navigator.pushReplacementNamed(
            context, 'home'); //navigasi dgn menggunakan route
      } else {
        print("belum memasukkan username atau password");
      }
    }

    return Scaffold(
      key: mainKey,
      body: ContainerWH(Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 120,
                        height: 120,
                        child: Image.asset('assets/placeholder.png')),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //for making username circular border
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green.withOpacity(0.5), width: 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            child: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            //create horizontal line after the person image
                            height: 30.0,
                            width: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                            margin:
                                const EdgeInsets.only(left: 00.0, right: 10.0),
                          ),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Masukkan Username",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Silahkan masukkan Username";
                                }
                              },
                              onSaved: (value) => _username = value,
                              autofocus: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //bagian PASSWORD
                    Container(
                      //for making username circular border
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green.withOpacity(0.5), width: 1.0),
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            child: Icon(
                              Icons.lock_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            //create horizontal line after the person image
                            height: 30.0,
                            width: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                            margin:
                                const EdgeInsets.only(left: 00.0, right: 10.0),
                          ),
                          Expanded(
                            child: TextFormField(
                              obscureText: hide,
                              style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Masukkan Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: IconButton(
                                    icon: hide ? _icon : _icon2,
                                    onPressed: () {
                                      print("tekan");
                                      setState(() {
                                        hide = !hide;
                                      });
                                    },
                                  )),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Silahkan masukkan Password";
                                }
                              },
                              onSaved: (value) => _password = value,
                            ),
                          )
                        ],
                      ),
                    ),
                    // TextFormField(
                    //   obscureText: hide,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //     labelText: 'Password',
                    //     border: OutlineInputBorder(),
                    //     suffixIcon: IconButton(
                    //       icon: hide ? _icon : _icon2,
                    //       onPressed: () {
                    //         print("tekan");
                    //         setState(() {
                    //           hide = !hide;
                    //         });
                    //       },
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return 'Silahkan masukkan Password';
                    //     }
                    //   },
                    //   onSaved: (value) => _password = value,
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: _onLoginButtonPressed,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                        onTap: register,
                        child: Text(
                          "Belum punya akun?",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  register() {
    return Navigator.pushNamed(context, 'register');
  }
}
