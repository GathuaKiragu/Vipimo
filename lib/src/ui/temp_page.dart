import 'package:charts_flutter/flutter.dart' as charts;
import 'package:demo_vipimo_flutter/src/blocs/temperature_data_bloc.dart';
import 'package:demo_vipimo_flutter/src/models/item_model.dart';
import 'package:flutter/material.dart';

class TimeSeriesTemperature {
  final DateTime time;
  final double temperature;

  TimeSeriesTemperature(this.time, this.temperature);
}

class TempPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TempPageState();
  }
}

class TempPageState extends State<TempPage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllData();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            new DropdownButton<String>(
              items: <String>['Today', 'Week', 'Month', 'Year']
                  .map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            Text("Temperature"),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new SizedBox(
                height: 450.0,
                child: StreamBuilder(
                  stream: bloc.allData,
                  builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                    if (snapshot.hasData) {
                      return buildChart(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChart(ItemModel snapshot) {
    List<TimeSeriesTemperature> data = [];

    for (var result in snapshot.results) {
      data.add(TimeSeriesTemperature(result.time, result.temperature));
    }

    List<charts.Series<TimeSeriesTemperature, DateTime>> series = [
      new charts.Series<TimeSeriesTemperature, DateTime>(
        id: 'Temperature',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesTemperature temperatures, _) => temperatures.time,
        measureFn: (TimeSeriesTemperature temperatures, _) => temperatures.temperature,
        data: data,
      ),
    ];

    return new charts.TimeSeriesChart(series);
  }
}
