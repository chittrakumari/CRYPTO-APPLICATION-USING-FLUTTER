import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:crypto_application/http_Dart/data_CryptoCurrency.dart';
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
    currency(
        url_data: 'bitcoin',
        currency_pic: 'bitcoin.png',
        currency_name: 'Bitcoin'),
    currency(
        url_data: 'ethereum',
        currency_pic: 'ethereum.png',
        currency_name: 'Ethereum'),
    currency(
        url_data: 'tether',
        currency_pic: 'tether.png',
        currency_name: 'Tether'),
    currency(
        url_data: 'cardano',
        currency_pic: 'cardano.png',
        currency_name: 'Cardano'),
    currency(
        url_data: 'dogecoin',
        currency_pic: 'dogecoin.png',
        currency_name: 'Dogecoin'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, currency_subscribed_data),
          ),
          title: Text(
            'Currency List',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'font1.otf',
              letterSpacing: 1.0,
            ),
          ),
          centerTitle: true,
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
                                ? Colors.amber[300]
                                : (pricedata[
                                            "${currency_data[index].currency_name}symbol"] ==
                                        'DOGE')
                                    ? Colors.lightGreen[300]
                                    : (pricedata[
                                                "${currency_data[index].currency_name}symbol"] ==
                                            'ETH')
                                        ? Colors.purple[100]
                                        : (pricedata[
                                                    "${currency_data[index].currency_name}symbol"] ==
                                                'USDT')
                                            ? Colors.teal[100]
                                            : Colors.grey[200],
                            margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6),
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: TranslationAnimatedWidget(
                                enabled:
                                    true, //update this boolean to forward/reverse the animation
                                values: [
                                  Offset(0, 220), // disabled value value
                                  Offset(0, 250), //intermediate value
                                  Offset(0, 0) //enabled value
                                ],
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'DetailsCryptocurrency',
                                        arguments: ({
                                          'currency_name': currency_data[index]
                                              .currency_name,
                                          'currency_pic':
                                              currency_data[index].url_data,
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
                                                backgroundColor:
                                                    Colors.amber[50],
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
                                                        color:
                                                            Colors.purple[800],
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
                                        SizedBox(width: 10.0),
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
                                            size: 26,
                                            color: Colors.green,
                                          ),
                                        if (pricedata[
                                                "${currency_data[index].currency_name}sign"] ==
                                            '')
                                          Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: 26,
                                            color: Colors.red,
                                          ),
                                        SizedBox(width: 0.0),
                                        Text(
                                          '${pricedata["${currency_data[index].currency_name}sign"]}${pricedata["${currency_data[index].currency_name}changePercent24Hr"]}%',
                                          style: TextStyle(
                                            fontFamily: 'font1.otf',
                                            //fontWeight: FontWeight.w800,
                                            fontSize: 19.0,
                                          ),
                                        ),
                                        SizedBox(width: 15.0),
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
                                    ),
                                  ),

                                  //SUBSCRIBED DATA
                                  subtitle: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            240.0, 0.0, 0, 0),
                                        child: TranslationAnimatedWidget(
                                          enabled:
                                              true, //update this boolean to forward/reverse the animation
                                          values: [
                                            Offset(
                                                0, 280), // disabled value value
                                            Offset(0, 280), //intermediate value
                                            Offset(0, 0) //enabled value
                                          ],
                                          child: RaisedButton(
                                            onPressed: () {
                                              Fluttertoast.showToast(
                                                  msg: "Subscribed!",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 3,
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),

                    //Arrow button
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonTheme(
                        buttonColor: Colors.deepPurple[600],
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context, currency_subscribed_data);
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
