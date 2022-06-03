import 'package:flutter/material.dart';
import 'package:per4/main.dart';
import 'package:per4/Widget/PageAppBar.dart';

class MyReservasi extends StatelessWidget {
  const MyReservasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Reservasi(),
    );
  }
}

class Reservasi extends StatelessWidget {
  const Reservasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              color: Colors.amber,
            ),
          ),
          Expanded(
            child: Container(
              height: 60,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
