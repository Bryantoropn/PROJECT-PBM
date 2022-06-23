import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:per4/Widget/PageAppBar.dart';
import '../NavBar.dart';

class DetailPemesanan extends StatelessWidget {
  const DetailPemesanan({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Profile(doc: doc),
    );
  }
}

class Profile extends StatelessWidget {
  Profile({Key? key, required this.doc}) : super(key: key);

  final QueryDocumentSnapshot doc;
  CollectionReference driver = FirebaseFirestore.instance.collection('driver');
  late QueryDocumentSnapshot dataDriver;

  Future<QueryDocumentSnapshot> getDriverOrder() async {
    var data = await driver.get();
    var data2 = data.docs;
    dataDriver = data2.firstWhere((docu) {
      return docu.id == doc['id_driver'];
    });
    return dataDriver;
  }

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
    var subtotal =
        convertToIdr((int.tryParse(doc['total'])! - 14000).toString(), 0);
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: Colors.black,
                  ),
                  backgroundColor: Color.fromARGB(255, 196, 196, 196),
                  maxRadius: 12,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.delivery_dining,
                  size: 24,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
                maxRadius: 20,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Driver telah tiba di restoran maems",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Pesananmu akan tiba dalam 20 menit",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 196, 196, 196),
          height: 5,
          thickness: 1,
          indent: 20,
          endIndent: 23,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 24,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 196, 196, 196),
                      maxRadius: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: FutureBuilder<QueryDocumentSnapshot>(
                          future: getDriverOrder(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!['nama_driver'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    snapshot.data!['no_telp'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!['rating'],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          169,
                                          39,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              );
                            } else {
                              return SizedBox(
                                height: 25,
                                width: 25,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        child: Icon(
                          Icons.chat,
                          size: 20,
                          color: Colors.white,
                        ),
                        backgroundColor: Color.fromARGB(255, 196, 196, 196),
                        maxRadius: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      child: Icon(
                        Icons.call,
                        size: 20,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 196, 196, 196),
                      maxRadius: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 255, 255, 255),
          height: 5,
          thickness: 6,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.food_bank,
                        size: 24,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 196, 196, 196),
                      maxRadius: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Alamat maems",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            Text(
                              "Jl. Diponegoro 12",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
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
          indent: 20,
          endIndent: 23,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 24,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 196, 196, 196),
                      maxRadius: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Alamat penerima",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
                            Text(
                              doc['alamat'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 255, 255, 255),
          height: 5,
          thickness: 6,
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Order",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doc['nama_makanan'],
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '${doc['banyak']}x',
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Divider(
                color: Color.fromARGB(255, 196, 196, 196),
                height: 5,
                thickness: 1,
              ),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("Subtotal"),
                            ),
                            Container(
                              child: Text(
                                subtotal,
                                style: TextStyle(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("Delivery fee"),
                            ),
                            Container(
                                child: Text("Rp. 7.000",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("Platform fee"),
                            ),
                            Container(
                                child: Text("Rp. 7.000",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold))),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("Total"),
                            ),
                            Container(
                              child: Text(
                                convertToIdr(doc['total'], 0),
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 255, 89, 37),
                  child: Text(
                    "Cancel Order",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content:
                            const Text('Apakah anda yakin ingin membatalkan?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomWidget(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
