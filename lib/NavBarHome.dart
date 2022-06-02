import 'package:flutter/material.dart';
import 'Home/home.dart';
import 'Message/chat.dart';
import 'History/history.dart';
import 'Profile/profil.dart';

class BottomWidgetHome extends StatefulWidget {
  const BottomWidgetHome({Key? key}) : super(key: key);

  @override
  State<BottomWidgetHome> createState() => _BottomWidgetHomeState();
}

class _BottomWidgetHomeState extends State<BottomWidgetHome> {
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
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.black,fontSize: 14),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( 
            icon: Icon(Icons.home_filled, color: Colors.grey,),
            activeIcon: Icon(Icons.home_filled,color: Colors.black,),
            label: "home", 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.grey,),
            activeIcon: Icon(Icons.message, color: Colors.black),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.grey,),
            activeIcon: Icon(Icons.history, color: Colors.black),
            label: 'History',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey,),
            activeIcon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
