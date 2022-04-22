import 'package:flutter/material.dart';
import 'package:per4/history.dart';
import 'package:per4/home.dart';
import 'package:per4/main.dart';
import 'package:per4/chat.dart';
import 'package:per4/profil.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

int pageIndex = 0;

final pages = [
  const Home(),
  const Chat(),
  const History(),
  const Profile(),
];

@override
Widget buildMyNavBar(BuildContext context) {
  return Container(
    decoration: BoxDecoration(color: Color.fromARGB(255, 247, 246, 255)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          enableFeedback: false,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          icon: pageIndex == 0
              ? const Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 35,
                )
              : const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 35,
                ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyChat()));
          },
          icon: pageIndex == 1
              ? const Icon(
                  Icons.message,
                  color: Colors.black,
                  size: 35,
                )
              : const Icon(
                  Icons.message_outlined,
                  color: Colors.black,
                  size: 35,
                ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHistory()));
          },
          icon: pageIndex == 2
              ? const Icon(
                  Icons.history_toggle_off,
                  color: Colors.black,
                  size: 35,
                )
              : const Icon(
                  Icons.history_outlined,
                  color: Colors.black,
                  size: 35,
                ),
        ),
        IconButton(
          enableFeedback: false,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyProfile()));
          },
          icon: pageIndex == 3
              ? const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 35,
                )
              : const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                  size: 35,
                ),
        ),
      ],
    ),
  );
}
