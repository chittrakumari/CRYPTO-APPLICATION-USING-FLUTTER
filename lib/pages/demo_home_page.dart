import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_application/pages/add_view.dart';
import 'package:crypto_application/pages/subscribed_list_empty.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class Demo_Home extends StatefulWidget {
  Demo_Home({Key? key}) : super(key: key);

  @override
  _Demo_HomeState createState() => _Demo_HomeState();
}

class _Demo_HomeState extends State<Demo_Home> {
  int c = 0;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          '   Subscribed     Currencies',
          style: TextStyle(
            fontSize: 26.0,
            fontFamily: 'font1.otf',
            letterSpacing: 1.0,
          ),
        ),
        //automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          (StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .collection('Coins')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Text(
                        "   \n      CURRENCY         CHANGE PERCENT         PRICE IN INR \n \n ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'font2.otf',
                          fontSize: 15.0,
                        ),
                      ),
                      ListView(
                        children: snapshot.data!.docs.map((document) {
                          return Column(children: [
                            Card(
                              margin: EdgeInsets.fromLTRB(10.0, 38.0, 10.0, 0),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    //
                                    document.data()['symbol'] == 'BTC'
                                        ? CircleAvatar(
                                            child: new IconButton(
                                              icon: new Icon(
                                                CryptoFontIcons.BTC,
                                                color: Colors.amber[800],
                                                size: 35.0,
                                              ),
                                              onPressed: () {},
                                            ),
                                            backgroundColor: Colors.amber[50],
                                            radius: 25.0,
                                          )
                                        : document.data()['symbol'] == 'ETH'
                                            ? CircleAvatar(
                                                child: new IconButton(
                                                  icon: new Icon(
                                                    CryptoFontIcons.ETH,
                                                    size: 35.0,
                                                    color: Colors.purple[800],
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                radius: 25.0,
                                                backgroundColor:
                                                    Colors.purple[50],
                                              )
                                            : document.data()['symbol'] ==
                                                    'USDT'
                                                ? CircleAvatar(
                                                    child: new IconButton(
                                                      icon: new Icon(
                                                        CryptoFontIcons.USDT,
                                                        size: 35.0,
                                                        color: Colors.teal[800],
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 25.0,
                                                  )
                                                : document.data()['symbol'] ==
                                                        'ADA'
                                                    ? CircleAvatar(
                                                        radius: 25.0,
                                                        //backgroundColor: Colors.white,
                                                        backgroundImage:
                                                            AssetImage(
                                                                'assets/ADA.jpg'),
                                                      )
                                                    : document.data()[
                                                                'symbol'] ==
                                                            'DOGE'
                                                        ? CircleAvatar(
                                                            child:
                                                                new IconButton(
                                                              icon: new Icon(
                                                                CryptoFontIcons
                                                                    .DOGE,
                                                                size: 35.0,
                                                                color: Colors
                                                                        .lightGreen[
                                                                    800],
                                                              ),
                                                              onPressed: () {},
                                                            ),
                                                            backgroundColor:
                                                                Colors.lightGreen[
                                                                    50],
                                                            radius: 25.0,
                                                          )
                                                        : document.data()[
                                                                    'symbol'] ==
                                                                'BCH'
                                                            ? CircleAvatar(
                                                                radius: 25.0,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        'assets/bitcoin cash.jpg'),
                                                              )
                                                            : document.data()[
                                                                        'symbol'] ==
                                                                    'ETC'
                                                                ? CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors.grey[
                                                                            100],
                                                                    child:
                                                                        new IconButton(
                                                                      icon:
                                                                          new Icon(
                                                                        CryptoFontIcons
                                                                            .ETC,
                                                                        size:
                                                                            35.0,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                    ),
                                                                    radius:
                                                                        25.0,
                                                                  )
                                                                : document.data()[
                                                                            'symbol'] ==
                                                                        'EOS'
                                                                    ? CircleAvatar(
                                                                        radius:
                                                                            25.0,
                                                                        backgroundImage:
                                                                            AssetImage('assets/eos.png'),
                                                                      )
                                                                    : document.data()['symbol'] ==
                                                                            'LTC'
                                                                        ? CircleAvatar(
                                                                            backgroundColor:
                                                                                Colors.yellow[50],
                                                                            child:
                                                                                new IconButton(
                                                                              icon: new Icon(
                                                                                CryptoFontIcons.LTC,
                                                                                size: 35.0,
                                                                                color: Colors.yellow[800],
                                                                              ),
                                                                              onPressed: () {},
                                                                            ),
                                                                            radius:
                                                                                25.0,
                                                                          )
                                                                        : document.data()['symbol'] ==
                                                                                'MIOTA'
                                                                            ? CircleAvatar(
                                                                                radius: 25.0,
                                                                                backgroundImage: AssetImage('assets/iota.png'),
                                                                              )
                                                                            : document.data()['symbol'] == 'XLM'
                                                                                ? CircleAvatar(
                                                                                    radius: 25.0,
                                                                                    backgroundImage: AssetImage('assets/stellar2.jpg'),
                                                                                  )
                                                                                : document.data()['symbol'] == 'XMR'
                                                                                    ? CircleAvatar(
                                                                                        child: new IconButton(
                                                                                          icon: new Icon(
                                                                                            CryptoFontIcons.XMR,
                                                                                            size: 35.0,
                                                                                          ),
                                                                                          onPressed: () {},
                                                                                        ),
                                                                                        radius: 25.0,
                                                                                      )
                                                                                    : document.data()['symbol'] == 'DASH'
                                                                                        ? CircleAvatar(
                                                                                            backgroundColor: Colors.brown[100],
                                                                                            child: new IconButton(
                                                                                              icon: new Icon(
                                                                                                CryptoFontIcons.DASH,
                                                                                                color: Colors.brown,
                                                                                                size: 35.0,
                                                                                              ),
                                                                                              onPressed: () {},
                                                                                            ),
                                                                                            radius: 25.0,
                                                                                          )
                                                                                        : document.data()['symbol'] == 'BNB'
                                                                                            ? CircleAvatar(
                                                                                                radius: 25.0,
                                                                                                backgroundImage: AssetImage('assets/bnb.png'),
                                                                                              )
                                                                                            : document.data()['symbol'] == 'TRX'
                                                                                                ? CircleAvatar(
                                                                                                    radius: 25.0,
                                                                                                    backgroundImage: AssetImage('assets/trx.png'),
                                                                                                  )
                                                                                                : document.data()['symbol'] == 'NEO'
                                                                                                    ? CircleAvatar(
                                                                                                        radius: 25.0,
                                                                                                        backgroundImage: AssetImage('assets/neo.jpg'),
                                                                                                      )
                                                                                                    : CircleAvatar(
                                                                                                        radius: 25.0,
                                                                                                        backgroundImage: AssetImage('assets/ADA.jpg'),
                                                                                                      ),//
                                    SizedBox(width: 2.5),
                                    SizedBox(width: 8.0),
                                    Text(
                                      '${document.data()['symbol']}',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    if ("${document.data()['sign']}" == '+')
                                      Icon(
                                        Icons.arrow_drop_up_outlined,
                                        size: 28,
                                        color: Colors.green,
                                      ),
                                    if (("${document.data()['sign']}" == ''))
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 28,
                                        color: Colors.red,
                                      ),
                                    Text(
                                      '${document.data()['sign']}${document.data()['change_percent']}%',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        //fontWeight: FontWeight.w800,
                                        fontSize: 19.0,
                                      ),
                                    ),
                                    SizedBox(width: 38.0),
                                    Text(
                                      '\u{20B9}${document.data()['Amount_in_USD']}',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        //fontWeight: FontWeight.w800,
                                        fontSize: 19.0,
                                      ),
                                    ),
                                  ],
                                  /*
                            Text("${document.data()['symbol']}"),
                            Text("${document.id}  ${document.data()['symbol']}"),
                            Text("${document.data()['change_percent']}"),
                            Text("${document.data()['Amount_in_USD']}"),
                          */
                                ),
                                subtitle: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        0.0,
                                        0.0,
                                        280.0,
                                        0.0,
                                      ),
                                      child: Text('${document.id}'),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(196.0, 0.0, 0, 0),
                                      child: ButtonTheme(
                                        minWidth: 110,
                                        height: 39,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            Fluttertoast.showToast(
                                                msg: "UnSubscribed!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 2,
                                                backgroundColor:
                                                    Colors.deepPurple,
                                                textColor: Colors.white,
                                                fontSize: 16.0);

                                            await _auth.removeCoin(document.id);
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
                              ),
                            )
                          ]);
                        }).toList(),
                      ),
                    ],
                  );
                } else {
                  return SubsribedListEmpty();
                }
              })),
          Align(
            alignment: Alignment.bottomRight,
            child: ButtonTheme(
              buttonColor: Colors.deepPurple,
              child: RaisedButton(
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context,'AddView');
                  }),
              shape: CircleBorder(side: BorderSide.none),
              padding: EdgeInsets.all(15.0),
            ),
          )
        ],
      ),
    );
  }
}
