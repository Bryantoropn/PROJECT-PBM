import 'package:flutter/material.dart';
import 'package:per4/Makanan/menu.dart';
import 'package:per4/Reservasi/Reservasi.dart';
import 'package:per4/Home/keranjang.dart';
import 'package:per4/Home/konfirmasi%20pemesanan.dart';
import 'package:per4/scanQrPage.dart';
import 'package:per4/Makanan/detailMakanan.dart';

import 'konfirmasi pemesanan.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 255),
      appBar: AppBar(
        leading: Container(),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: IconButton(
              icon: Icon(Icons.qr_code_2_rounded),
              iconSize: 30,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyScanQr()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyKeranjang()));
              },
              icon: Icon(Icons.shopping_basket),
              iconSize: 30,
            ),
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
                  'image/appbar.png',
                ),
                fit: BoxFit.cover),
          ),
        ),
        bottom: PreferredSize(
            child: Transform(
              transform: Matrix4.translationValues(-40.0, -40.0, 0.0),
              child: Text(
                'MAEMS APP',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            preferredSize: Size.fromHeight(125)),
      ),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SEARCH LINE ========================================
          Container(
            margin: EdgeInsets.all(25),
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Mau madang apa ?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Montserrat Bold'),
                      )),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                            height: 21,
                            width: 265,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 6,
                                      offset: Offset(0, 4),
                                      color: Color.fromARGB(255, 234, 234, 234))
                                ]),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(10, 3, 0, 0),
                                child: Text(
                                  'Type here ...',
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: 'Montserrat Regular',
                                      color:
                                          Color.fromARGB(255, 198, 198, 198)),
                                )),
                          ),
                        ],
                      )),
                  Align(
                    child: Text(
                      'Selamat datang di aplikasi botox tempatnya orang cari makan ketika mereka kelaparan  Lapar adalah kondisi ketika perut terasa sakit dan sakit itu nyata.',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Roboto Light'),
                    ),
                  )
                ],
              ),
            ),
          ),
          // MENU LINE ==========================================
          Container(
              margin: EdgeInsets.fromLTRB(40, 0, 25, 0),
              child: Column(
                children: [
                  Text('MENU'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 59,
                        width: 147,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  blurRadius: 6,
                                  offset: Offset(0, 2))
                            ],
                            color: Color.fromARGB(255, 236, 246, 255),
                            image: DecorationImage(
                                image: AssetImage('image/MenuFullMeal.png'),
                                fit: BoxFit.cover)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyMenu()));
                          },
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Container(
                        height: 59,
                        width: 147,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  blurRadius: 6,
                                  offset: Offset(0, 2))
                            ],
                            color: Color.fromARGB(255, 236, 246, 255),
                            image: DecorationImage(
                                image: AssetImage('image/MenuBestSeller.png'),
                                fit: BoxFit.cover)),
                        child: InkWell(
                          onTap: () {},
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 59,
                        width: 147,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  blurRadius: 6,
                                  offset: Offset(0, 2))
                            ],
                            color: Color.fromARGB(255, 236, 246, 255),
                            image: DecorationImage(
                                image: AssetImage('image/MenuPromo.png'),
                                fit: BoxFit.cover)),
                        child: InkWell(
                          onTap: () {},
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Container(
                        height: 59,
                        width: 147,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  blurRadius: 6,
                                  offset: Offset(0, 2))
                            ],
                            color: Color.fromARGB(255, 236, 246, 255),
                            image: DecorationImage(
                                image: AssetImage('image/MenuReservasi.png'),
                                fit: BoxFit.cover)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyReservasi()));
                          },
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          // TOP OF THE WEEK
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: EdgeInsetsDirectional.all(20),
            height: 162,
            width: 4390,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            child: Column(
              children: [
                // TOP OF THE WEEK
                Text(
                  'TOP OF THE WEEK',
                  style: TextStyle(fontFamily: 'Montserrat Semi Bold'),
                ),
                // Makanan terlaris
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Nikmati makanan-makanan terlaris dan terenak dalam satu minggu terakhir.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat Regular', fontSize: 11),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          height: 47.76,
                          width: 119,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 197, 197, 197),
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Color.fromARGB(255, 236, 246, 255),
                              image: DecorationImage(
                                  image: AssetImage('image/SoftChocoCream.png'),
                                  fit: BoxFit.cover)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailMakanan()));
                            },
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          height: 47.76,
                          width: 119,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 197, 197, 197),
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Color.fromARGB(255, 236, 246, 255),
                              image: DecorationImage(
                                  image: AssetImage('image/SoftChocoCream.png'),
                                  fit: BoxFit.cover)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailMakanan()));
                            },
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          height: 47.76,
                          width: 119,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 197, 197, 197),
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Color.fromARGB(255, 236, 246, 255),
                              image: DecorationImage(
                                  image: AssetImage('image/SoftChocoCream.png'),
                                  fit: BoxFit.cover)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailMakanan()));
                            },
                            customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // CUSTOMER SERVICE
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: Text(
                    'CUSTOMER SERVICE',
                    style: TextStyle(
                        fontFamily: 'Montserrat Semi Bold', fontSize: 12),
                  ),
                ),
                Container(
                  child: Text(
                    'Silakan hubungi customer service kami dengan mengakses button dibawah ini',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Roboto Light', fontSize: 11),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'HERE',
                      style: TextStyle(
                          fontFamily: 'Montserrat Bold',
                          fontSize: 11,
                          color: Colors.red),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Container(
                  child: Text(
                    'Terrima kasih atas kesediaan anda',
                    style: TextStyle(fontFamily: 'Roboto Light', fontSize: 11),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
