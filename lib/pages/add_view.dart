import 'package:crypto_application/http_dart/data_CryptoCurrency.dart';
import 'package:crypto_application/pages/LoadingPage.dart';
import 'package:flutter/material.dart';
import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  void initState() {
    // TODO: implement initState
    updatePrice();
    super.initState();
  }

  Map pricedata = {};
  Map currency_subscribed_data = {};
  List<currency> currency_data = [
    currency(url_data: 'bitcoin', currency_name: 'Bitcoin'),
    currency(url_data: 'ethereum', currency_name: 'Ethereum'),
    currency(url_data: 'tether', currency_name: 'Tether'),
    currency(url_data: 'cardano', currency_name: 'Cardano'),
    currency(url_data: 'dogecoin', currency_name: 'Dogecoin'),
    currency(url_data: 'bitcoin-cash', currency_name: 'Bitcoin Cash'),
    currency(url_data: 'eos', currency_name: 'EOS'),
    currency(url_data: 'stellar', currency_name: 'Stellar'),
    currency(url_data: 'litecoin', currency_name: 'Litecoin'),
    currency(url_data: 'dash', currency_name: 'DASH'),
    currency(url_data: 'iota', currency_name: 'IOTA'),
    currency(url_data: 'monero', currency_name: 'Monero'),
    currency(url_data: 'ethereum-classic', currency_name: 'Ethereum Classic'),
    currency(url_data: 'tron', currency_name: 'TRON'),
    currency(url_data: 'neo', currency_name: 'NEO'),
    currency(url_data: 'binance-coin', currency_name: 'Binance Coin'),
  ];

  String dropdownValue = "bitcoin";
  String sign = '';
  String symbol = "";
  double change_precent = 0.0;
  double _amount = 0.0;
  Future<bool> updatePrice() async {
    for (int index = 0; index < currency_data.length; index++) {
      currency instance = currency_data[index];
      await instance.getData();
      pricedata.addAll({
        '${currency_data[index].currency_name}price_in_USD':
            instance.price_in_USD,
        '${currency_data[index].currency_name}price_in_INR':
            instance.price_in_INR,
        '${currency_data[index].currency_name}marketCapUsd':
            instance.marketCapUsd,
        '${currency_data[index].currency_name}maxSupply': instance.maxSupply,
        '${currency_data[index].currency_name}volumeUsd24Hr':
            instance.volumeUsd24Hr,
        '${currency_data[index].currency_name}changePercent24Hr':
            instance.changePercent24Hr,
        '${currency_data[index].currency_name}vwap24Hr': instance.vwap24Hr,
        '${currency_data[index].currency_name}symbol': instance.symbol,
        '${currency_data[index].currency_name}sign': instance.sign,
        '${currency_data[index].currency_name}rank': instance.rank,
      });
    }
    
    return true;
  }

  final AuthService _auth = AuthService();
  @override
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingPage()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                '   Currency  List',
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'font1.otf',
                  letterSpacing: 1.0,
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, 'LoginPage');
                  },
                  icon: Icon(
                    Icons.person,
                    size: 27.0,
                  ),
                  label: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'font1.otf',
                    ),
                  ),
                ),
              ],
              elevation: 0.0,
              backgroundColor: Colors.deepPurple,
            ),
            body: FutureBuilder(
              future: updatePrice(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ));
                } else {
                  return Stack(
                    children: [
                      ListView.builder(
                          itemCount: currency_data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: (pricedata[
                                          "${currency_data[index].currency_name}symbol"] ==
                                      'BTC')
                                  ? Colors.yellow[600]
                                  : (pricedata["${currency_data[index].currency_name}symbol"] ==
                                          'DOGE')
                                      ? Colors.lightGreen[300]
                                      : (pricedata["${currency_data[index].currency_name}symbol"] ==
                                              'ETH')
                                          ? Colors.purple[100]
                                          : (pricedata["${currency_data[index].currency_name}symbol"] ==
                                                  'USDT')
                                              ? Colors.teal[100]
                                              : (pricedata[
                                                          "${currency_data[index].currency_name}symbol"] ==
                                                      'BCH')
                                                  ? Colors.blue[100]
                                                  : (pricedata[
                                                              "${currency_data[index].currency_name}symbol"] ==
                                                          'BCH')
                                                      ? Colors.grey[200]
                                                      : (pricedata[
                                                                  "${currency_data[index].currency_name}symbol"] ==
                                                              'XMR')
                                                          ? Colors.blue[100]
                                                          : (pricedata[
                                                                      "${currency_data[index].currency_name}symbol"] ==
                                                                  'LTC')
                                                              ? Colors
                                                                  .yellow[600]
                                                              : (pricedata[
                                                                          "${currency_data[index].currency_name}symbol"] ==
                                                                      'EOS')
                                                                  ? Colors.blueGrey[
                                                                      100]
                                                                  : (pricedata[
                                                                              "${currency_data[index].currency_name}symbol"] ==
                                                                          'ETC')
                                                                      ? Colors
                                                                              .blueGrey[
                                                                          100]
                                                                      : (pricedata["${currency_data[index].currency_name}symbol"] ==
                                                                              'XLM')
                                                                          ? Colors
                                                                              .teal[800]
                                                                          : (pricedata["${currency_data[index].currency_name}symbol"] == 'DASH')
                                                                              ? Colors.brown[300]
                                                                              : (pricedata["${currency_data[index].currency_name}symbol"] == 'BNB')
                                                                                  ? Colors.amber[400]
                                                                                  : (pricedata["${currency_data[index].currency_name}symbol"] == 'ADA')
                                                                                      ? Colors.grey[100]
                                                                                      : (pricedata["${currency_data[index].currency_name}symbol"] == 'TRX')
                                                                                          ? Colors.red[600]
                                                                                          : Colors.grey[200],
                              margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6),
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'DetailsCryptocurrency',
                                      arguments: ({
                                        'currency_name':
                                            currency_data[index].currency_name,
                                        'currency_pic':
                                            currency_data[index].url_data,
                                        'symbol': pricedata[
                                            "${currency_data[index].currency_name}symbol"],
                                        'price': pricedata[
                                            "${currency_data[index].currency_name}price_in_INR"],
                                        'rank': pricedata[
                                            "${currency_data[index].currency_name}rank"],
                                        'marketCapUsd': pricedata[
                                            "${currency_data[index].currency_name}marketCapUsd"],
                                        'maxSupply': pricedata[
                                            "${currency_data[index].currency_name}maxSupply"],
                                        'volumeUsd24Hr': pricedata[
                                            "${currency_data[index].currency_name}volumeUsd24Hr"],
                                        'changePercent24Hr': pricedata[
                                            "${currency_data[index].currency_name}changePercent24Hr"],
                                        'vwap24Hr': pricedata[
                                            "${currency_data[index].currency_name}vwap24Hr"],
                                      }));
                                },

                                title: Row(
                                  children: [
                                    pricedata["${currency_data[index].currency_name}symbol"] ==
                                            'BTC'
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
                                        : (pricedata[
                                                    "${currency_data[index].currency_name}symbol"] ==
                                                'ETH')
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
                                            : (pricedata[
                                                        "${currency_data[index].currency_name}symbol"] ==
                                                    'USDT')
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
                                                : (pricedata[
                                                            "${currency_data[index].currency_name}symbol"] ==
                                                        'ADA')
                                                    ? CircleAvatar(
                                                        radius: 25.0,
                                                        //backgroundColor: Colors.white,
                                                        backgroundImage:
                                                            AssetImage(
                                                                'assets/ADA.jpg'),
                                                      )
                                                    : (pricedata[
                                                                "${currency_data[index].currency_name}symbol"] ==
                                                            'DOGE')
                                                        ? CircleAvatar(
                                                            backgroundColor:
                                                                Colors.lightGreen[
                                                                    100],
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
                                                            radius: 25.0,
                                                          )
                                                        : (pricedata[
                                                                    "${currency_data[index].currency_name}symbol"] ==
                                                                'BCH')
                                                            ? CircleAvatar(
                                                                radius: 25.0,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        'assets/bitcoin cash.jpg'),
                                                              )
                                                            : (pricedata[
                                                                        "${currency_data[index].currency_name}symbol"] ==
                                                                    'ETC')
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
                                                                : (pricedata[
                                                                            "${currency_data[index].currency_name}symbol"] ==
                                                                        'EOS')
                                                                    ? CircleAvatar(
                                                                        radius:
                                                                            25.0,
                                                                        backgroundImage:
                                                                            AssetImage('assets/eos.png'),
                                                                      )
                                                                    : (pricedata["${currency_data[index].currency_name}symbol"] ==
                                                                            'XMR')
                                                                        ? CircleAvatar(
                                                                            // backgroundColor: Colors.lightGreen[100],
                                                                            child:
                                                                                new IconButton(
                                                                              icon: new Icon(
                                                                                CryptoFontIcons.XMR,
                                                                                size: 35.0,
                                                                              ),
                                                                              onPressed: () {},
                                                                            ),

                                                                            radius:
                                                                                25.0,
                                                                          )
                                                                        : (pricedata["${currency_data[index].currency_name}symbol"] ==
                                                                                'LTC')
                                                                            ? CircleAvatar(
                                                                                backgroundColor: Colors.yellow[50],
                                                                                child: new IconButton(
                                                                                  icon: new Icon(
                                                                                    CryptoFontIcons.LTC,
                                                                                    size: 35.0,
                                                                                    color: Colors.yellow[800],
                                                                                  ),
                                                                                  onPressed: () {},
                                                                                ),
                                                                                radius: 25.0,
                                                                              )
                                                                            : (pricedata["${currency_data[index].currency_name}symbol"] == 'MIOTA')
                                                                                ? CircleAvatar(
                                                                                    radius: 25.0,
                                                                                    backgroundImage: AssetImage('assets/iota.png'),
                                                                                  )
                                                                                : (pricedata["${currency_data[index].currency_name}symbol"] == 'XLM')
                                                                                    ? CircleAvatar(
                                                                                        backgroundColor: Colors.black,
                                                                                        radius: 25.0,
                                                                                        backgroundImage: AssetImage('assets/stellar2.jpg'),
                                                                                      )
                                                                                    : (pricedata["${currency_data[index].currency_name}symbol"] == 'DASH')
                                                                                        ? CircleAvatar(
                                                                                            backgroundColor: Colors.brown[100],
                                                                                            child: new IconButton(
                                                                                              icon: new Icon(
                                                                                                CryptoFontIcons.DASH,
                                                                                                size: 35.0,
                                                                                                color: Colors.brown[700],
                                                                                              ),
                                                                                              onPressed: () {},
                                                                                            ),
                                                                                            radius: 25.0,
                                                                                          )
                                                                                        : (pricedata["${currency_data[index].currency_name}symbol"] == 'BNB')
                                                                                            ? CircleAvatar(
                                                                                                radius: 25.0,
                                                                                                backgroundImage: AssetImage('assets/bnb.png'),
                                                                                              )
                                                                                            : (pricedata["${currency_data[index].currency_name}symbol"] == 'TRX')
                                                                                                ? CircleAvatar(
                                                                                                    radius: 25.0,
                                                                                                    backgroundImage: AssetImage('assets/trx.png'),
                                                                                                  )
                                                                                                : (pricedata["${currency_data[index].currency_name}symbol"] == 'NEO')
                                                                                                    ? CircleAvatar(
                                                                                                        radius: 25.0,
                                                                                                        backgroundImage: AssetImage('assets/neo.jpg'),
                                                                                                      )
                                                                                                    : CircleAvatar(
                                                                                                        radius: 25.0,
                                                                                                        backgroundImage: AssetImage('assets/ADA.jpg'),
                                                                                                      ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      '${pricedata["${currency_data[index].currency_name}symbol"]}',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        //fontWeight: FontWeight.w800,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    if (pricedata[
                                            "${currency_data[index].currency_name}sign"] ==
                                        '+')
                                      Icon(
                                        Icons.arrow_drop_up_outlined,
                                        size: 28,
                                        color: Colors.green,
                                      ),
                                    if (pricedata[
                                            "${currency_data[index].currency_name}sign"] ==
                                        '')
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        size: 28,
                                        color: Colors.red,
                                      ),
                                    Text(
                                      '${pricedata["${currency_data[index].currency_name}sign"]}${pricedata["${currency_data[index].currency_name}changePercent24Hr"]}%',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        //fontWeight: FontWeight.w800,
                                        fontSize: 19.0,
                                      ),
                                    ),
                                    SizedBox(width: 38.0),
                                    Text(
                                      '\$',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        fontSize: 19.0,
                                      ),
                                    ),
                                    Text(
                                      '${pricedata["${currency_data[index].currency_name}price_in_USD"]}',
                                      style: TextStyle(
                                        fontFamily: 'font1.otf',
                                        //fontWeight: FontWeight.w800,
                                        fontSize: 19.0,
                                      ),
                                    ),
                                  ],
                                ), //title
                                subtitle: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(240.0, 0.0, 0, 0),
                                      child: RaisedButton(
                                        color: Colors.deepPurple,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Text(
                                          'Subscribe',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () async {
                                          Fluttertoast.showToast(
                                              msg: "Subscribed!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 3,
                                              backgroundColor:
                                                  Colors.deepPurple,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          setState(() {
                                            dropdownValue = currency_data[index]
                                                .currency_name;
                                            change_precent = pricedata[
                                                "${currency_data[index].currency_name}changePercent24Hr"];
                                            _amount = pricedata[
                                                "${currency_data[index].currency_name}price_in_INR"];
                                            symbol = pricedata[
                                                "${currency_data[index].currency_name}symbol"];
                                            sign = pricedata[
                                                "${currency_data[index].currency_name}sign"];
                                          });
                                          await _auth.addCoin(
                                              dropdownValue,
                                              _amount,
                                              change_precent,
                                              symbol,
                                              sign);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ButtonTheme(
                          buttonColor: Colors.deepPurple[600],
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'Demo');
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          shape: CircleBorder(side: BorderSide.none),
                          padding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ],
                  );
                }
              },
            ));
  }
}
