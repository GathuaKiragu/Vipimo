import 'dart:convert';

import 'package:demo_vipimo_flutter/src/models/item_model.dart';
import 'package:http/http.dart';

class DataApiProvider {
  Client client = Client();
  final _apiUrl =
      "http://94.237.50.38:3000/api/vipimo/nodedata?nodeadrr=19000007&lastdays=1";

  Future<ItemModel> fetchTemperatureData() async {
    final response = await client.get(_apiUrl);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
