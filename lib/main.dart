import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_application/firebase_authentication/wrapper.dart';
import 'package:crypto_application/models/user.dart';
import 'package:crypto_application/pages/add_view.dart';
import 'package:crypto_application/pages/demo_home_page.dart';
import 'package:crypto_application/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/pages/cryptocurrencyList.dart';
import 'package:crypto_application/pages/homePage.dart';
import 'package:crypto_application/pages/WelcomePage.dart';
import 'package:crypto_application/pages/loginPage.dart';
import 'package:crypto_application/pages/detailsCryptoCurrency.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
     
      value: AuthService().user,
       initialData: null,
      child:
          MaterialApp(
            home:  WelcomePage(), 
            debugShowCheckedModeBanner: false,
              initialRoute: 'WelcomePage',
              routes: {
            'WelcomePage': (context) => WelcomePage(),
            'LoginPage':(context)=>LoginPage(),
            'RegisterPage':(context)=>RegisterPage(),
            'Demo':(context)=>Demo_Home(),
            'HomePage': (context) => Home(),
            'CryptoCurrencyList': (context) => CryptoCurrencyList(),
            'DetailsCryptocurrency': (context) => DetailsCryptocurrency(),
            'Wrapper':(context)=>Wrapper(),
             'AddView':(context)=>AddView(),
          }),
    );
  }
}
