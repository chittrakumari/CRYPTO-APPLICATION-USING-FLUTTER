

import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Map data = {};
  //final AuthService _auth = AuthService();
  // ignore: file_names

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      if (null != ModalRoute.of(context)!.settings.arguments) {
        data.addAll(ModalRoute.of(context)!.settings.arguments as Map);
      }
    }
    if (data.isNotEmpty) {}

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Subscribed Cryptocurrencies ',
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'font1.otf',
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              if (data.isEmpty)
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/image4.png'),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 48.0),
                      Text(
                        'Tap to add Currencies',
                        style: TextStyle(
                          fontFamily: 'font1.otf',
                          fontSize: 28.0,
                        ),
                      )
                    ],
                  ),
                ),
              if (data.isNotEmpty)
                Stack(
                  children: [
                    Text(
                      "   \n       CURRENCY         CHANGE PERCENT          PRICE IN INR \n \n ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'font2.otf',
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var key = data.keys.elementAt(index);
                          return Card(
                              margin: EdgeInsets.fromLTRB(10.0, 37.0, 5.0, 0),
                              child: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: ListTile(
                                    dense: true,
                                    title: Row(
                                      children: [
                                        data['${key}']['symbol'] == 'BTC'
                                            ? CircleAvatar(
                                                child: new IconButton(
                                                  icon: new Icon(
                                                    CryptoFontIcons.BTC,
                                                    color: Colors.amber[800],
                                                    size: 35.0,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                backgroundColor:
                                                    Colors.amber[50],
                                                radius: 25.0,
                                              )
                                            : (data['${key}']['symbol'] ==
                                                    'ETH')
                                                ? CircleAvatar(
                                                    child: new IconButton(
                                                      icon: new Icon(
                                                        CryptoFontIcons.ETH,
                                                        size: 35.0,
                                                        color:
                                                            Colors.purple[800],
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    radius: 25.0,
                                                    backgroundColor:
                                                        Colors.purple[50],
                                                  )
                                                : (data['${key}']['symbol'] ==
                                                        'USDT')
                                                    ? CircleAvatar(
                                                        child: new IconButton(
                                                          icon: new Icon(
                                                            CryptoFontIcons
                                                                .USDT,
                                                            size: 35.0,
                                                            color: Colors
                                                                .teal[800],
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 25.0,
                                                      )
                                                    : (data['${key}']
                                                                ['symbol'] ==
                                                            'ADA')
                                                        ? CircleAvatar(
                                                            radius: 25.0,
                                                            //backgroundColor: Colors.white,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    'assets/ADA.jpg'),
                                                          )
                                                        : (data['${key}'][
                                                                    'symbol'] ==
                                                                'DOGE')
                                                            ? CircleAvatar(
                                                                child:
                                                                    new IconButton(
                                                                  icon:
                                                                      new Icon(
                                                                    CryptoFontIcons
                                                                        .DOGE,
                                                                    size: 35.0,
                                                                    color: Colors
                                                                            .lightGreen[
                                                                        800],
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                                backgroundColor:
                                                                    Colors.lightGreen[
                                                                        50],
                                                                radius: 25.0,
                                                              )
                                                            : CircleAvatar(
                                                                radius: 25.0,
                                                                //backgroundColor: Colors.white,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        'assets/ADA.jpg'),
                                                              ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          '${data['${key}']['symbol']}',
                                          style: TextStyle(
                                            fontFamily: 'font1.otf',
                                            fontSize: 22.0,
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        if (data['${key}']['sign'] == '+')
                                          Icon(
                                            Icons.arrow_drop_up_outlined,
                                            size: 26,
                                            color: Colors.green,
                                          ),
                                        if (data['${key}']['sign'] == '')
                                          Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: 26,
                                            color: Colors.red,
                                          ),
                                        Text(
                                          '${data['${key}']['sign']}${data['${key}']['changePercent24Hr']}%',
                                          style: TextStyle(
                                            fontFamily: 'font1.otf',
                                            //fontWeight: FontWeight.w800,
                                            fontSize: 19.0,
                                          ),
                                        ),
                                        SizedBox(width: 11.0),
                                        Text(
                                          '\u{20B9}${data['${key}']['price_in_INR']}',
                                          style: TextStyle(
                                            fontFamily: 'font1.otf',
                                            fontSize: 19.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                            0.0,
                                            0.0,
                                            286.0,
                                            0.0,
                                          ),
                                          child: Text('${key}'),
                                        ),
                                        SizedBox(height: 4.0),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              196.0, 0.0, 0, 0),
                                          child: ButtonTheme(
                                            minWidth: 110,
                                            height: 40,
                                            child: RaisedButton(
                                              onPressed: () {
                                                Fluttertoast.showToast(
                                                    msg: "UnSubscribed!",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 2,
                                                    backgroundColor:
                                                        Colors.deepPurple,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                setState(() {
                                                  data.remove('${key}');
                                                });
                                              },
                                              child: Text(
                                                'UnSubscribe',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              color: Colors.deepPurple,
                                            ),
                                            // ignore: file_name
                                          ),
                                        ),
                                      ],
                                    ),
                                  )));
                        })
                  ],
                ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonTheme(
              buttonColor: Colors.deepPurple,
              child: RaisedButton(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  dynamic datalist =
                      await Navigator.pushNamed(context, 'CryptoCurrencyList');
                  setState(() {
                    data.addAll(datalist);
                  });
                },
              ),
              shape: CircleBorder(side: BorderSide.none),
              padding: EdgeInsets.all(15.0),
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
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'LoginPage');
              },
            ),
          ),
        ],
      ),
    );
  }
}
