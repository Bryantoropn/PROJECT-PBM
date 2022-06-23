import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservasiHistoryTile extends StatelessWidget {
  const ReservasiHistoryTile({
    Key? key,
    required this.nama,
    required this.tanggal,
  }) : super(key: key);
  final String nama;
  final String tanggal;

  String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(int.tryParse(number));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      child: Row(
        children: [
          Container(
            //padding: EdgeInsets.only(top: 10),
            child: Image(
              image: AssetImage("./image/ReservasiImg.png"),
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nama,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tanggal Reservasi: ${tanggal}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 255, 89, 37),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
