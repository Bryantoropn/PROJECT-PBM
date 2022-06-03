import 'package:flutter/material.dart';
import 'package:per4/Home/keranjang.dart';
import 'package:per4/NavBar.dart';

class CardReservasi extends StatelessWidget {
  final namaGambar;

  CardReservasi({this.namaGambar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Expanded(
        child: Container(
          margin: EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 197, 197, 197),
                  blurRadius: 6,
                  offset: Offset(0, 2))
            ],
          ),
          child: Image.asset(namaGambar),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BottomWidget()));
      },
    );
  }
}
