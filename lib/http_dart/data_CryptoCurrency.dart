import 'package:http/http.dart';
import 'dart:convert';



class currency {
  var rank;
  String url_data;
  String currency_pic;
  String currency_name;
  var price_in_USD;
  var price_in_INR;
  var marketCapUsd;
  var maxSupply;
  var volumeUsd24Hr;
  double changePercent24Hr=0.0;
  var vwap24Hr;
  var sign;
  currency({required this.url_data,required this.currency_pic,required this.currency_name});
  var symbol;
var quotes;

  Future<void> getData() async {
    try {
      var url = Uri.parse("https://api.coincap.io/v2/assets/$url_data");
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      Map data1 = data["data"];
     
      price_in_USD =
          double.parse(double.parse(data1["priceUsd"]).toStringAsFixed(2));
      price_in_INR = double.parse(
          (double.parse(data1["priceUsd"]) * 72.91).toStringAsFixed(1));
      marketCapUsd =
          double.parse(double.parse(data1["marketCapUsd"]).toStringAsFixed(1));
      maxSupply = data1["maxSupply"];
      volumeUsd24Hr =
          double.parse(double.parse(data1["volumeUsd24Hr"]).toStringAsFixed(1));

      changePercent24Hr = double.parse(
          double.parse(data1["changePercent24Hr"]).toStringAsFixed(1));
      if (changePercent24Hr > 0) {
        sign = "+";
      }
      else {
        sign = "";
      }
      vwap24Hr = data1["vwap24Hr"];
      symbol = data1["symbol"];
      rank = data1["rank"];




    }


    catch (e) {
      print(e);





    }
  }

  }