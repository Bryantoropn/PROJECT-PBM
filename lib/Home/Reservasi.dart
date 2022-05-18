import 'package:flutter/material.dart';
import 'package:per4/main.dart';
import 'package:per4/PageAppBar.dart';

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
      child: Text("yolo"),
    );
  }
}
