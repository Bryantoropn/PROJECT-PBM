import 'dart:html';

import 'package:flutter/material.dart';
import 'package:per4/main.dart';
import 'package:per4/Widget/PageAppBar.dart';
import 'package:per4/Widget/reservasiMiniCard.dart';

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
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 197, 197, 197),
                    blurRadius: 6,
                    offset: Offset(0, 2))
              ]),
              child: Image.asset('image/appbarReservasi2.png')),
          // MENU SEBELAH KIRI //
          Row(
            children: [
              // MENU KIRI //
              Expanded(
                  child: Column(
                children: [
                  CardReservasi(
                    namaGambar: 'images/RES1.png',
                  ),
                  CardReservasi(
                    namaGambar: 'images/RES1.png',
                  ),
                  CardReservasi(
                    namaGambar: 'images/RES1.png',
                  ),
                ],
              )),

              // MENU KANAN //
              Expanded(
                  child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsetsDirectional.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 197, 197, 197),
                              blurRadius: 6,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: Text('FILTER'),
                    ),
                  ),
                  CardReservasi(
                    namaGambar: 'images/RES1.png',
                  ),
                  CardReservasi(
                    namaGambar: 'images/RES1.png',
                  ),
                ],
              )),
            ],
          ),

          Container(
            child: Column(
              children: [
                Text('CUSTOMER SERVICE'),
                Text(
                    'Silakan hubungi customer service kami dengan mengakses button dibawah ini'),
                SizedBox(),
                Text('Terrima kasih atas kesediaan anda')
              ],
            ),
          )
        ],
      ),
    );
  }
}
