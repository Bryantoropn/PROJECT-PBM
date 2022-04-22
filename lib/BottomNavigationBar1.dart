import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'history.dart';
import 'profil.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    MyChat(),
    MyHistory(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: const Text('Bottom Navigation Bar'),
      //),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( 
            icon: Icon(Icons.home_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.home,color: Colors.black,),
            label: "home", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.message, color: Colors.black),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.history_toggle_off, color: Colors.black),
            label: 'History',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.black,),
            activeIcon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
