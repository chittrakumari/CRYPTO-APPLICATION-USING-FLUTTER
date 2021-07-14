import 'dart:html';

import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart'
    show AuthService;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            ' Login Page ',
            style: TextStyle(
                letterSpacing: 2.0,
                fontWeight: FontWeight.w800,
                fontSize: 30.0),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/login_page_image.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
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

                SizedBox(height: 25.0),

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

                SizedBox(height: 10.0),

                //Button Theme for password
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  child: TextFormField(
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

                SizedBox(height: 28.0),

                ButtonTheme(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                  minWidth: 200.0,
                  height: 54.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.deepPurple,
                    child: Text('Forgot Password',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),

                SizedBox(height: 28.0),

                //Button Theme for Sign in

                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0, 20.0, 0),
                    child: ButtonTheme(
                      minWidth: 130.0,
                      height: 44.0,
                      buttonColor: Colors.deepPurple,
                      child: RaisedButton(
                        onPressed: () async {
                          dynamic result = await _auth.signInAnon();

                          if (result == null) {
                            print("error signing in");
                          } else {
                            print("signed in");
                            print(result.uid);
                            Fluttertoast.showToast(
                                msg: "Signed in succesfully!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          Navigator.pushNamed(context, 'HomePage');
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),

                  //Button Theme for sign up
                  ButtonTheme(
                    minWidth: 130.0,
                    height: 44.0,
                    buttonColor: Colors.deepPurple,
                    child: RaisedButton(
                      onPressed: () {},
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
                  )
                ]),

                SizedBox(height: 28.0),

                ButtonTheme(
                  minWidth: 350.0,
                  height: 55.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: SignInButton(
                        Buttons.Email,
                        text: 'Sign up with Email',
                        onPressed: () {},
                      )),
                ),

                SizedBox(height: 15.0),

                ButtonTheme(
                  minWidth: 350.0,
                  height: 55.0,
                  buttonColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: SignInButton(
                        Buttons.Facebook,
                        text: 'Sign up with Facebook',
                        onPressed: () {},
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
