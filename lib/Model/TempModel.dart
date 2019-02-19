import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:convert';

class TempModel {
  final DateTime time;
  final double temp;

  TempModel({
    this.time,
    this.temp,
  });

  static Future<TempModel> pareItem(String body) async {
    JsonDecoder decoder = new JsonDecoder();

    var current = await decoder.convert(body);

    //List of temp values
    List temp3 = new List();

    //List of dates
    List dateList = new List();
    var item;

    for (var i = 0; i < current.length; i++) {

      if (current[i].containsKey("Temperature2")) {

        var temp2 = current[i]["Temperature2"];
        var dateTime = current[i]["DataTime"];

        //Formatting api date to DateTime Format
        var newDateTimeObj2 = new DateFormat("yyyy-MM-ddTHH:mm:ss.000Z").parse(dateTime);


        temp3.add(temp2["Data"].toString());
        dateList.add(newDateTimeObj2);

        
        item = TempModel(
          time: newDateTimeObj2,
          temp: temp2["Data"].toDouble(),
        );
      } else {
        
      }
    }
    return item;
  }
}
