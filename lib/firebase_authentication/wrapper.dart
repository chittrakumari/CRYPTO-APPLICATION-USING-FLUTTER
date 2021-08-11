import 'package:crypto_application/firebase_authentication/authenticate.dart';
import 'package:crypto_application/models/user.dart';
import 'package:crypto_application/pages/demo_home_page.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/pages/homePage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);
    print(user);

    //return Home or authenticate widget.
    if (user == null) {
      return Authenticate();
    } else {
      return Demo_Home();
    }
  }
}
