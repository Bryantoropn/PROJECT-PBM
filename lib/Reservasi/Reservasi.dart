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
    return Container(
      color: Color.fromARGB(255, 247, 246, 255),
      child: SingleChildScrollView(
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
              child: Image.asset(
                'image/appbarReservasi2.png',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CardReservasi(
                    type: 'Outdoor',
                    namaGambar: 'images/RES1.png',
                  ),
                ),
                Expanded(
                  child: CardReservasi(
                    type: 'Couple',
                    namaGambar: 'images/RES4.png',
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('image/mainGradasi.png'))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    alignment: FractionalOffset.center,
                    child: Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      children: [
                        Text('CUSTOMER SERVICE'),
                        Text(
                            'Silakan hubungi customer service kami dengan mengakses button dibawah ini'),
                        Text('Terrima kasih atas kesediaan anda')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
