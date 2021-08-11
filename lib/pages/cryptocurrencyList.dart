import 'package:crypto_application/firebase_authentication/firebase_services/auth.dart';
import 'package:crypto_application/http_dart/data_CryptoCurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_application/pages/LoadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CryptoCurrencyList extends StatefulWidget {
  @override
  _CryptoCurrencyListState createState() => _CryptoCurrencyListState();
}

class _CryptoCurrencyListState extends State<CryptoCurrencyList> {
  @override
  void initState() {
    // TODO: implement initState
    updatePrice();
    super.initState();
  }

  //currencreies in home page.nhhnn
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

  //prices to print in home page
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

  bool loading = false;
  final AuthService _auth = AuthService();
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
                              margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6),
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'DetailsCryptocurrency',
                                        arguments: ({
                                          'currency_name': currency_data[index]
                                              .currency_name,
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

                                  title: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Row(
                                      children: [
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
                                  ),

                                  //SUBSCRIBED DATA
                                  subtitle: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            240.0, 0.0, 0, 0),

                                        child: RaisedButton(
                                          onPressed: () {
                                            currency_subscribed_data.addAll({
                                              '${currency_data[index].currency_name}':
                                                  {
                                                'price_in_INR': pricedata[
                                                    "${currency_data[index].currency_name}price_in_INR"],
                                                'symbol': pricedata[
                                                    "${currency_data[index].currency_name}symbol"],
                                                'sign': pricedata[
                                                    "${currency_data[index].currency_name}sign"],
                                                'changePercent24Hr': pricedata[
                                                    "${currency_data[index].currency_name}changePercent24Hr"],
                                              }
                                            });
                                          },
                                          color: Colors.deepPurple,
                                          child: Text(
                                            'Subscribe',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        // ignore: file_name
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        //Arrow button
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ButtonTheme(
                            buttonColor: Colors.deepPurple[600],
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(
                                    context, currency_subscribed_data);
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
                }));
  }
}
