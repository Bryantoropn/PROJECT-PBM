import 'package:flutter/material.dart';
import 'package:per4/Reservasi/Reservasi.dart';
import 'package:per4/Home/keranjang.dart';
import 'package:per4/Home/konfirmasi%20pemesanan.dart';
import 'package:per4/scanQrPage.dart';
import 'package:per4/Widget/reservasiMiniCard.dart';

class widgetReview extends StatelessWidget {
  final namaUser;
  final isiPesan;

  widgetReview({this.namaUser, this.isiPesan});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(right: 4, left: 4),
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 196, 196, 196),
            backgroundImage: AssetImage("image/profil.png"),
            maxRadius: 25,
          ),
          title: Text(
            namaUser,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(isiPesan, style: TextStyle(fontSize: 12)),
          trailing: Text("16:30"),
        ),
        Divider(
          color: Color.fromARGB(255, 196, 196, 196),
          height: 5,
          thickness: 1,
          indent: 70,
          endIndent: 10,
        ),
      ],
    );
  }
}

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
      body: const DetailRes(),
    );
  }
}

class DetailRes extends StatelessWidget {
  const DetailRes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            // DESKRIPSI ATAS //
            Container(
              margin: EdgeInsetsDirectional.all(20),
              child: Text(
                'Maems menyediakan layanan reservasi untuk pasangan dengan fasilitas berupa dua bangku dan satu buah meja.',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5, fontWeight: FontWeight.bold),
              ),
            ),

            // GAMBAR //
            Container(
              padding: EdgeInsetsDirectional.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  // TITLE GAMBAR //
                  Container(
                    margin: EdgeInsetsDirectional.all(10),
                    child: Text(
                      "GAMBAR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  // GAMBAR //
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardReservasi(
                          namaGambar: 'images/RES3.png',
                          lebar: 200,
                        ),
                        CardReservasi(
                          namaGambar: 'images/RES1.png',
                          lebar: 200,
                        ),
                        CardReservasi(
                          namaGambar: 'images/RES3.png',
                          lebar: 200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // LOAD MORE //
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "LOAD MORE",
                style: TextStyle(letterSpacing: 2),
              ),
            ),

            // PESAN OR KERANJANG //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  padding: EdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 119, 0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 185, 185, 185),
                          blurRadius: 6,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: Text(
                    'PESAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 253, 253),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  padding: EdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 119, 0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 185, 185, 185),
                          blurRadius: 6,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: Text(
                    'PESAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            // REVIEW //
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "REVIEW",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  widgetReview(
                    namaUser: "Ardin Nugroho",
                    isiPesan: "Wah ini tempatnya luas banget",
                  ),
                  widgetReview(
                    namaUser: "Bryantoro saputro",
                    isiPesan: "Nyaman beut",
                  ),
                  widgetReview(
                    namaUser: "Fadhli Nur",
                    isiPesan: "Gracias!!",
                  ),
                  widgetReview(
                    namaUser: "Thomas Slebew",
                    isiPesan: "You 'll never walk alone",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
