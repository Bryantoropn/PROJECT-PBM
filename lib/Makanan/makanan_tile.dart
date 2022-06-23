import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'detailMakanan.dart';

class MakananTile extends StatelessWidget {
  const MakananTile({
    Key? key,
    required this.nama,
    required this.harga,
    required this.rating,
    required this.id,
  }) : super(key: key);
  final String nama;
  final String harga;
  final String rating;
  final String id;

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
      margin: EdgeInsets.all(5),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Rating",
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      rating,
                    ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Color.fromARGB(255, 255, 169, 39),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                convertToIdr(harga, 0),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 255, 89, 37),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ButtonTheme(
                minWidth: 14,
                height: 20,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                  child: Text(
                    "Pesan",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMakanan(
                          nama: nama,
                          harga: harga,
                          id: id,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
