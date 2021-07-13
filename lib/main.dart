
import 'package:crypto_application/firebase_authentication/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/pages/cryptocurrencyList.dart';
import 'package:crypto_application/pages/homePage.dart';
import 'package:crypto_application/pages/loadingPage.dart';
import 'package:crypto_application/pages/loginPage.dart';
import 'package:crypto_application/pages/detailsCryptoCurrency.dart';

void main()=>runApp(
  MaterialApp(
      home: Home() ,
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoadingPage',
      routes: {
        'LoadingPage':(context)=>LoadingPage(),
        'LoginPage':(context)=>LoginPage(),
        'HomePage':(context)=>Home(),
        'CryptoCurrencyList':(context)=>CryptoCurrencyList(),
        'DetailsCryptocurrency':(context)=>DetailsCryptocurrency(),
        'home':(context)=>Wrapper(),
      }
  ),
);
