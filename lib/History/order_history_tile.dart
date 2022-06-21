import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class OrderHistoryTile extends StatelessWidget {
  const OrderHistoryTile({
    Key? key,
    required this.nama,
    required this.total,
  }) : super(key: key);
  final String nama;
  final String total;

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
              image: AssetImage("./image/nasgor.png"),
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
                    convertToIdr(total, 0),
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
          // Column(
          //   children: [
          //     Text(
          //       "TOTAL: HARGA",
          //       style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold,
          //         fontStyle: FontStyle.italic,
          //         color: Color.fromARGB(255, 255, 89, 37),
          //       ),
          //     ),
          //     Text(""),
          //     ButtonTheme(
          //       minWidth: 14,
          //       height: 20,
          //       child: RaisedButton(
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10)),
          //         textColor: Colors.black,
          //         color: Colors.white,
          //         child: Text(
          //           "Reorder",
          //           style: TextStyle(
          //             fontSize: 12,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         onPressed: () {},
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
