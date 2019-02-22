import 'package:intl/intl.dart';

class ItemModel {
  String _time;
  var _temperature;
  List<_Result> _results = [];

  ItemModel.fromJson(List<dynamic> parsedJson) {
    print(parsedJson);
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      if (parsedJson[i].containsKey("Temperature2")) {
        _temperature = parsedJson[i]['Temperature2']['Data'].toDouble();
        _time = parsedJson[i]['DataTime'];
        _Result result = _Result(_time, _temperature);
        temp.add(result);
      }
    }
    _results = temp;
  }

  List<_Result> get results => _results;
}

class _Result {
  DateTime _time;
  double _temperature;

  _Result(String time, double temperature) {
    _time = new DateFormat("yyyy-MM-ddTHH:mm:ss.000Z").parse(time);
    _temperature = temperature.toDouble();
  }

  DateTime get time => _time;
  double get temperature => _temperature;
}
