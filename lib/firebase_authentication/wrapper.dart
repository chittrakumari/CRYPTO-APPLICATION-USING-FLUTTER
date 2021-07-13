import 'package:crypto_application/firebase_authentication/authenticate.dart';
import 'package:crypto_application/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/pages/homePage.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget
    return Authenticate();
  }
}
