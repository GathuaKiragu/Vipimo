import 'package:demo_vipimo_flutter/src/ui/temp_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vipimo Demo',
      theme: ThemeData(
          primaryColor: Colors.green[800], accentColor: Colors.green[800]),
      home: TempPage(),
    );
  }
}
