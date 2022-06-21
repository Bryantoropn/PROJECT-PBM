import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:per4/Widget/PageAppBar.dart';
import 'package:per4/map/maps.dart';

class konfirmPemesanan extends StatefulWidget {
  konfirmPemesanan({
    Key? key,
    required this.nama,
    required this.harga,
    required this.id,
  }) : super(key: key);
  final String nama;
  final int harga;
  final String id;

  @override
  State<konfirmPemesanan> createState() => _konfirmPemesananState();
}

class _konfirmPemesananState extends State<konfirmPemesanan> {
  CollectionReference menu =
      FirebaseFirestore.instance.collection('pemesanan_makanan');
  CollectionReference driver = FirebaseFirestore.instance.collection('driver');

  final String documentId = FirebaseAuth.instance.currentUser!.uid;

  int items = 1;
  bool isSearching = false;
  bool isGetDriver = false;
  late var driverDetail;
  late QueryDocumentSnapshot docsTemp;

  String convertToIdr(num number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

  Future<void> getDriver() async {
    final _random = new Random();
    var futureData = await driver.get();
    var listDriver = futureData.docs;
    var getDriver = listDriver[_random.nextInt(listDriver.length)];
    driverDetail = getDriver;
  }

  Future<void> _getPesan() async {
    setState(() {
      isSearching = true;
    });
    try {
      await getDriver();
      var data = await menu.add({
        "nama_makanan": widget.nama,
        "total": (widget.harga * items + 14000).toString(),
        "banyak": items.toString(),
        "id_user": FirebaseAuth.instance.currentUser!.uid,
        "id_driver": driverDetail.id,
        "tgl_pemesanan": DateTime.now()
      });
      var targetCollection = await menu.get();
      docsTemp =
          targetCollection.docs.firstWhere((element) => element.id == data.id);
      print(data.id);
      await Future.delayed(Duration(seconds: 4));
    } catch (e) {}
    setState(() {
      isSearching = false;
      isGetDriver = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Delivery Address",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Jl. Pattimura no 2",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 14,
                            height: 20,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              textColor: Colors.black,
                              color: Colors.white,
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 14,
                      height: 20,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        textColor: Colors.black,
                        color: Colors.white,
                        child: Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(
                      color: Color.fromARGB(255, 196, 196, 196),
                      height: 5,
                      thickness: 1,
                      indent: 2,
                      endIndent: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Color.fromARGB(255, 196, 196, 196),
                                  ),
                                  backgroundColor: Colors.white,
                                  maxRadius: 18,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Delivery",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Select order type",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                            maxRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 10,
                thickness: 5,
                indent: 1,
                endIndent: 1,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Order",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 14,
                      height: 20,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        textColor: Colors.black,
                        color: Colors.white,
                        child: Text(
                          "Add items",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            items++;
                          });
                        },
                      ),
                    ),
                    if (items > 1)
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: ButtonTheme(
                          minWidth: 14,
                          height: 20,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            textColor: Colors.black,
                            color: Colors.white,
                            child: Text(
                              "Remove items",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              setState(() {
                                items--;
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.nama,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Notes: Kecap sedikit",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        ButtonTheme(
                                          minWidth: 14,
                                          height: 20,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                            ),
                                            textColor: Colors.black,
                                            color: Colors.white,
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                convertToIdr(widget.harga, 0),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 255, 89, 37),
                                ),
                              ),
                              Text(
                                "${items}x",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(""),
                              Text(""),
                              Text(""),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Column(
                        children: [
                          Divider(
                            color: Color.fromARGB(255, 196, 196, 196),
                            height: 5,
                            thickness: 1,
                            indent: 1,
                            endIndent: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 1, right: 9, top: 5),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Subtotal"),
                                      ),
                                      Container(
                                        child: Text(
                                          convertToIdr(widget.harga * items, 0),
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 89, 37),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Delivery fee"),
                                      ),
                                      Container(
                                        child: Text(
                                          "Rp. 7.000",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 89, 37),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Platform fee"),
                                      ),
                                      Container(
                                        child: Text(
                                          "Rp. 7.000",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 89, 37),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 5,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text("Total"),
                                      ),
                                      Container(
                                        child: Text(
                                          convertToIdr(
                                              widget.harga * items + 14000, 0),
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 89, 37),
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: ButtonTheme(
                  minWidth: 14,
                  height: 20,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Text(
                      "Use voucher",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 35),
                child: Column(
                  children: [
                    Container(
                      child: Divider(
                        color: Color.fromARGB(255, 196, 196, 196),
                        height: 10,
                        thickness: 3,
                        indent: 1,
                        endIndent: 1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(right: 4, left: 4),
                        leading: Icon(
                          Icons.credit_card,
                          size: 35,
                        ),
                        title: const Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text("Select payment method",
                            style: TextStyle(fontSize: 12)),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 16,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 50,
                        right: 50,
                        top: 20,
                        bottom: 20,
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        child: (isSearching == false && isGetDriver == false)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          convertToIdr(
                                              widget.harga * items + 14000, 0),
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 89, 37),
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 10,
                                          color: Colors.black,
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 196, 196, 196),
                                        maxRadius: 8,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : (isSearching == true && isGetDriver == false)
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Mencari Driver",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23,
                                        height: 23,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Dapat driver!"),
                                            Text(
                                              "Driver: " +
                                                  driverDetail['nama_driver'] +
                                                  " (" +
                                                  driverDetail['no_telp'] +
                                                  ")",
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyMaps(
                                                doc: docsTemp,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 80,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Check\ndelivery",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                        onPressed: () {
                          if (isSearching != true ||
                              (isSearching != false && isGetDriver == true)) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text('Apakah anda yakin ?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);

                                      await _getPesan();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
