import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_application/pages/LoadingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading?LoadingPage():Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '      Register',
            style: TextStyle(
                letterSpacing: 2.0,
                fontWeight: FontWeight.w800,
                fontSize: 31.0),
          ),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'LoginPage');
              },
              icon: Icon(
                Icons.person,
                size: 30.0,
              ),
              label: Text(
                'Sign In',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 23.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
          /*decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/login_page_image.png'),
              fit: BoxFit.fitWidth,
            ),
          ),*/
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0, 20.0, 0),
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 50,
                        )),
                    Text(
                      'Username',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: 'font1.otf',
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0,
                      ),
                    ),
                  ]),

                  SizedBox(height: 10.0),

                  //Button Theme for Username
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                    child: TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? 'enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: 'Enter your Username',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),

                  SizedBox(height: 45.0),

                  Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 0, 20.0, 0),
                        child: Icon(
                          Icons.lock_open,
                          size: 40,
                        )),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: 'font1.otf',
                        fontWeight: FontWeight.w500,
                        fontSize: 30.0,
                      ),
                    ),
                  ]),

                  SizedBox(height: 15.0),

                  //Button Theme for password
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a password more than 6 characters Long'
                          : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: 'Enter your Password',
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),

                  SizedBox(height: 47.0),

                  //Button Theme for Sign in

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(117.0, 0, 20.0, 0),
                        child: ButtonTheme(
                          minWidth: 130.0,
                          height: 44.0,
                          buttonColor: Colors.deepPurple,
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'please supply a valid email';
                                    loading = false;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Signed in succesfully!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.deepPurple,
                                      textColor: Colors.white,
                                      fontSize: 20.0);
                                  Navigator.pushReplacementNamed(
                                      context, 'Home');
                                }
                              }
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
