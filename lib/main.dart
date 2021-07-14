import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_application/firebase_authentication/wrapper.dart';
import 'package:crypto_application/models/user.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/pages/cryptocurrencyList.dart';
import 'package:crypto_application/pages/homePage.dart';
import 'package:crypto_application/pages/loadingPage.dart';
import 'package:crypto_application/pages/loginPage.dart';
import 'package:crypto_application/pages/detailsCryptoCurrency.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp()
    /*MaterialApp(
          home: Home(),
          debugShowCheckedModeBanner: false,
          initialRoute: 'LoadingPage',
          routes: {
            'LoadingPage': (context) => LoadingPage(),
            'LoginPage': (context) => LoginPage(),
            'HomePage': (context) => Home(),
            'CryptoCurrencyList': (context) => CryptoCurrencyList(),
            'DetailsCryptocurrency': (context) => DetailsCryptocurrency(),
            'home': (context) => Wrapper(),
          }),*/

    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
          home: const Wrapper(),
          debugShowCheckedModeBanner: false,
          initialRoute: 'LoadingPage',
          routes: {
            'LoadingPage': (context) => LoadingPage(),
            'LoginPage': (context) => LoginPage(),
            'HomePage': (context) => Home(),
            'CryptoCurrencyList': (context) => CryptoCurrencyList(),
            'DetailsCryptocurrency': (context) => DetailsCryptocurrency(),
          }),
    );
  }
}
