import 'package:flutter/material.dart';
import 'package:demo_vipimo_flutter/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vipimo Demo',
      theme: ThemeData(
          primaryColor: Colors.green[800], accentColor: Colors.green[800]),
      home: Home(),
    );
  }
}
