import 'package:flutter/material.dart';
import 'package:demo_vipimo_flutter/Charts/simple_time_series_chart.dart';

class TempPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            new DropdownButton<String>(
              items: <String>['Today', 'Week', 'Month', 'Year'].map((String value) {
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
                child: new SimpleTimeSeriesChart.withSampleData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
