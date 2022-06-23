import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:per4/Home/konfirmasi%20pemesanan.dart';

class KeranjangCard extends StatelessWidget {
  KeranjangCard({
    Key? key,
    required this.nama,
    required this.harga,
    required this.id,
  }) : super(key: key);
  final String nama;
  final String harga;
  final String id;

  String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(int.tryParse(number));
  }

  final keranjang = FirebaseFirestore.instance
      .collection("keranjang")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("list");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Image(
                image: AssetImage("./image/nasgor.png"),
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      nama,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      convertToIdr(harga, 0),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 255, 89, 37),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonTheme(
                          minWidth: 10,
                          height: 16,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            textColor: Colors.black,
                            color: Colors.white,
                            child: Text(
                              "Pesan",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return konfirmPemesanan(
                                    nama: nama,
                                    harga: int.tryParse(harga) ?? 0,
                                    id: id,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () async {
                            try {
                              await keranjang.doc(id).delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Makanan dihapus"),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            }
                          },
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
    );
  }
}

// Text(
                    //   "Notes: Kecap sedikit",
                    //   style:
                    //       TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    // ),