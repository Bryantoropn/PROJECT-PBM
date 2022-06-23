import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:per4/Home/keranjang.dart';
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
  const DetailReservasi({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 255),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
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
        bottom: PreferredSize(
          child: Transform(
            transform: Matrix4.translationValues(-80.0, -40.0, 0.0),
            child: Text(
              type,
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: DetailRes(type: type),
    );
  }
}

class DetailRes extends StatefulWidget {
  DetailRes({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  State<DetailRes> createState() => _DetailResState();
}

class _DetailResState extends State<DetailRes> {
  CollectionReference preservasi =
      FirebaseFirestore.instance.collection('pemesanan_reservasi');
  CollectionReference reservasi =
      FirebaseFirestore.instance.collection('reservasi');
  TextEditingController tglC = TextEditingController();

  void _getPesan() async {
    if (tglC.text != "" || tglC.text.isNotEmpty) {
      try {
        await preservasi.add({
          "nama_reservasi": widget.type,
          "id_user": FirebaseAuth.instance.currentUser!.uid,
          "tgl_reservasi": tglC.text
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Pemesanan berhasil"),
        ));
      } catch (e) {}
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Pemesanan gagal"),
      ));
    }
  }

  Widget build(BuildContext context) {
    String convertToIdr(dynamic number, int decimalDigit) {
      NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp',
        decimalDigits: decimalDigit,
      );
      return currencyFormatter.format(int.tryParse(number));
    }

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            // DESKRIPSI ATAS //
            Container(
              margin: EdgeInsetsDirectional.all(20),
              child: Text(
                (widget.type == "Couple")
                    ? 'Maems menyediakan layanan reservasi untuk pasangan dengan fasilitas berupa dua bangku dan satu buah meja.'
                    : 'Maems menyediakan layanan reservasi berbis outdoor (Luar ruangan)',
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
                          type: "null",
                          namaGambar: 'images/RES4.png',
                          lebar: 200,
                        ),
                        CardReservasi(
                          type: "null",
                          namaGambar: 'images/RES1.png',
                          lebar: 200,
                        ),
                        CardReservasi(
                          type: "null",
                          namaGambar: 'images/RES4.png',
                          lebar: 200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: reservasi
                  .where('nama_reservasi', isEqualTo: widget.type)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs;
                    return Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(
                          children: [
                            Text(
                              data[0]["nama_reservasi"],
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Price : ${convertToIdr(data[0]["harga"], 0)} / hour',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ));
                  } else {
                    return Text("Empty");
                  }
                } else {
                  return Text("loading");
                }
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: <Widget>[
                  DateTimePicker(
                    controller: tglC,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Pilih tanggal reservasi',
                    validator: (v) {
                      print(v);
                      return null;
                    },
                    onSaved: (v) => print(v),
                  )
                ],
              ),
            ),

            // PESAN OR KERANJANG //
            GestureDetector(
              onTap: () async {
                _getPesan();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(50, 30, 50, 30),
                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 119, 0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 185, 185, 185),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    )
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
            ), ],
        ),
      ),
    );
  }
}
