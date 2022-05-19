import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nautic_mobile_app/pages/contacts.dart';
import 'package:nautic_mobile_app/pages/history.dart';
import 'package:nautic_mobile_app/pages/home.dart';

class Navigation extends StatefulWidget{
  const Navigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Navigation();
}
class _Navigation extends State<StatefulWidget>{

  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    History(),
    Contacts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xff4893b7),
                  Color(0xff98dfca),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          Container(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("assets/images/home.png"),
              height: 22,
            ),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/images/history.png"),
                height: 22,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/images/map.png"),
                height: 22,
              ),
              label: ''
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}