import 'package:flutter/material.dart';
import 'package:per4/main.dart';

import '../Home/keranjang.dart';
import '../Login/Regis/login.dart';

class MyFeedback extends StatelessWidget {
  const MyFeedback({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 247, 246, 255),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MAEMS APP",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyKeranjang()));},
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: Feedback(),
    );
  }
}

class Feedback extends StatelessWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Divider(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 5,
              thickness: 6,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              title: const Text(
                'PIN Settings',
                style: TextStyle(fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 12,
              endIndent: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              title: const Text(
                'Language',
                style: TextStyle(fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 12,
              endIndent: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              title: const Text(
                'Invite Friends',
                style: TextStyle(fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 5,
              thickness: 6,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              title: const Text(
                'Terms of Service',
                style: TextStyle(fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 12,
              endIndent: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 12,
              endIndent: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              title: const Text(
                'Help Center',
                style: TextStyle(fontSize: 15),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 12,
              endIndent: 10,
            ),
          ],
        ));
  }
}
