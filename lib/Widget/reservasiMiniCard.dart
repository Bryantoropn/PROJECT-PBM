import 'package:flutter/material.dart';
import 'package:per4/Home/keranjang.dart';
import 'package:per4/NavBar.dart';
import 'package:per4/Reservasi/DetailReservasi.dart';

class CardReservasi extends StatelessWidget {
  final namaGambar;
  final lebar;
  final tinggi;

  CardReservasi({this.namaGambar, this.lebar, this.tinggi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Expanded(
        child: Container(
          width: lebar,
          height: tinggi,
          margin: EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 146, 146, 146),
                  blurRadius: 6,
                  offset: Offset(0, 4))
            ],
          ),
          child: Image.asset(namaGambar),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailReservasi()));
      },
    );
  }
}
