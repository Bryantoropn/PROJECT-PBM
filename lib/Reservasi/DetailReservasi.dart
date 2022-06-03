import 'package:flutter/material.dart';
import 'package:per4/Reservasi/Reservasi.dart';
import 'package:per4/Home/keranjang.dart';
import 'package:per4/Home/konfirmasi%20pemesanan.dart';
import 'package:per4/scanQrPage.dart';

class DetailReservasi extends StatelessWidget {
  const DetailReservasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 255),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('image/maems.png')],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyKeranjang()));
            },
            icon: Icon(Icons.add_shopping_cart),
            color: Color.fromARGB(255, 255, 252, 252),
          )
        ],
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        elevation: 6,
        flexibleSpace: Container(
          child: Container(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/RES1.png',
                ),
                fit: BoxFit.cover),
          ),
        ),
        bottom: PreferredSize(
            child: Transform(
              transform: Matrix4.translationValues(-80.0, -40.0, 0.0),
              child: Text(
                'COUPLE',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            preferredSize: Size.fromHeight(200)),
      ),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
