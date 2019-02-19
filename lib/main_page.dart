import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:demo_vipimo_flutter/Pages/temp_page.dart';
import 'package:demo_vipimo_flutter/Pages/humidity_page.dart';
import 'package:demo_vipimo_flutter/Pages/moisture_page.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List _children = [
   TempPage(),
   HumidityPage(),
   MoisturePage(),

   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vipimo Demo"),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(MdiIcons.thermometer),
            title: Text('Temperature'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(MdiIcons.waterPercent),
            title: Text('Humidity'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(MdiIcons.water), title: Text('Moisture'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
