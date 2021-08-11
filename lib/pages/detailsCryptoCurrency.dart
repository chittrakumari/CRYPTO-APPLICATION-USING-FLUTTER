import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_application/pages/cryptocurrencyList.dart';
import 'package:crypto_application/pages/loginPage.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/main.dart';
import 'homePage.dart';

class DetailsCryptocurrency extends StatefulWidget {
  @override
  _DetailsCryptocurrency createState() => _DetailsCryptocurrency();
}

final AuthService _auth = AuthService();

class _DetailsCryptocurrency extends State<DetailsCryptocurrency> {
  Map currency_tapped_data = {};
  @override
  Widget build(BuildContext context) {
    currency_tapped_data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        
       iconTheme: IconThemeData(
    color: Colors.black,
    size: 90.0, //change your color here
  ),
      ),
        body: Stack(
      children: [
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/bg.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      Padding(
        padding: EdgeInsets.fromLTRB(120.0, 10.0, 0.0, 0),
                  child: Column(
            children: [
Row(
  children:[
    
                                                  
                                                                                                    
                 Text(
                  '${currency_tapped_data["symbol"]}/INR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.lightBlue[500],
                    fontSize: 29.0,
                  ),
                ),
            ],
),            
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(120.0, 40.0, 0.0, 0),
              child: Text(
                '${currency_tapped_data["currency_name"]}',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 29.0,
                ),
              ),
            ),],
            ),
            Padding(
                          padding: EdgeInsets.fromLTRB(90.0, 180.0, 0.0, 0),
                          child: Column(
                children: [
                  Text(
                  'Rank',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 29.0,
                  ),
                  ),
                  Text(
                  '${currency_tapped_data["rank"]}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 29.0,
                  ),
                ),
                  SizedBox(height:20.0 ),
                Text(
                  'PRICE',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 29.0,
                  ),
                ),
              Text(
                  '\u{20B9}${currency_tapped_data["price"]}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 29.0,
                  ),
                ),
                  SizedBox(height:20.0 ),
                  Text(
                'VOLUME',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 29.0,
                ),
              ),
              Text(
                '${currency_tapped_data["volumeUsd24Hr"]}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 29.0,
                ),
              ),
              SizedBox(height:20.0),
              Text(
                'CHANGE %',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.black,
                  fontSize: 29.0,
                ),
              ),
           Text('${currency_tapped_data["changePercent24Hr"]} %',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontSize: 29.0,
                ),)
                ],
              ),
            ),
            
      
      ],
    ));
  }
}
