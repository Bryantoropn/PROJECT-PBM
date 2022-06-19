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

class DetailMakanan extends StatelessWidget {
  const DetailMakanan({Key? key}) : super(key: key);
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
                  './image/nasgor.png',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // GAMBAR //
            Container(
              padding: EdgeInsetsDirectional.all(20),
              child: Column(
                children: [
                  // TITLE GAMBAR //
                  Container(
                    margin: EdgeInsetsDirectional.all(10),
                    child: Text(
                      "Nasi Goreng",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  // INPUT //
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(
                            "Rp. 32.000",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textColor: Colors.white,
                color: Color.fromARGB(255, 255, 89, 37),
                child: Text(
                  "Pesan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => konfirmPemesanan()));
                          },
              ),
            ),
            Container(
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
                    namaUser: "Adi",
                    isiPesan: "Wah ini tempatnya luas banget",
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
