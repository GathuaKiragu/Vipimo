import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:demo_vipimo_flutter/Model/TempModel.dart';

//Network Call
class NetworkUtil {
 static Future<TempModel> currentWeather() async {
    var response = await http.get(
        "http://94.237.50.38:3000/api/vipimo/nodedata?nodeadrr=19000007&lastdays=1");
    if (response.statusCode == 200) {
     // print("current:${response.body}");
      var item = await TempModel.pareItem(response.body);    


      print("ITEM " + item.toString());  
      print("time:${item.time}");
      print("temperature:${item.temp.toString()}");
      return item;
    }
    return null;
  }
}
