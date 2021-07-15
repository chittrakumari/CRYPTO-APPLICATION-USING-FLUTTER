import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
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
          title: Text(
            '${currency_tapped_data["currency_name"]} Details',
            style: TextStyle(
                fontSize: 33.0, fontFamily: 'font1.otf', letterSpacing: 1.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
          child: Column(
            children: [
              Text(
                'Currency name:  ${currency_tapped_data["currency_name"]} \n \n Price in INR:  \u{20B9}${currency_tapped_data["price"]} \n \n'
                'changePercent24Hr: ${currency_tapped_data["changePercent24Hr"]} \n  marketCapUsd:${currency_tapped_data["marketCapUsd"]} \n \n rank:  ${currency_tapped_data["rank"]} ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'font1.otf',
                ),
              ),
            Align(
            alignment: Alignment.bottomLeft,
            child: RaisedButton.icon(
              icon: Icon(
                Icons.person,
                size: 30.0,
              ),
              label: Text('logout'),
              onPressed:  ()  async {
             //Navigator.pushReplacementNamed(context, 'LoginPage');
             await _auth.signOut();
              },
            ),
          ),  
            ],
          ),
        ));
  }
}
