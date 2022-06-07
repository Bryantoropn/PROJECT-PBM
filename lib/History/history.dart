import 'package:flutter/material.dart';
import '../Widget/PageAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Home/keranjang.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: History(),
    );
  }
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var list_item = [];

  @override
  void initState() {
    super.initState();
  }

  getData() {
    var colBuku = FirebaseFirestore.instance.collection('history');
    colBuku.get().then((value) {
      print('value');
      print(value);
      print(value.docs.length);
      setState(() {
        list_item = value.docs.map((e) {
          return {
            'harga': e['harga'],
            'nama_makanan': e['nama_makanan'],
            'rating': e['rating'],
            'tanggal': e['tanggal'],
          };
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('history');
    final String documentId1 = '1';
    final String documentId2 = '2';
    return Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "This Month",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              FutureBuilder<DocumentSnapshot>(
                future: users.doc(documentId1).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return SizedBox(
                      height: 100,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Image(
                                        image:
                                            AssetImage("./image/nasgor.png")),
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
                                            "${data['nama_makanan']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${data['tanggal']}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text(""),
                                          Text(
                                            "Your rating",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Row(
                                            children: [
                                              Text("${data['rating']}"),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Color.fromARGB(
                                                    255, 255, 169, 39),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text("${data['harga']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color:
                                            Color.fromARGB(255, 255, 89, 37))),
                                Text(""),
                                ButtonTheme(
                                  minWidth: 14,
                                  height: 20,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                    child: Text(
                                      "Reorder",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Text("loading");
                },
              ),
              FutureBuilder<DocumentSnapshot>(
                future: users.doc(documentId2).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return SizedBox(
                      height: 100,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Image(
                                        image:
                                            AssetImage("./image/nasgor.png")),
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
                                            "${data['nama_makanan']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${data['tanggal']}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text(""),
                                          Text(
                                            "Your rating",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Row(
                                            children: [
                                              Text("${data['rating']}"),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: Color.fromARGB(
                                                    255, 255, 169, 39),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text("${data['harga']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color:
                                            Color.fromARGB(255, 255, 89, 37))),
                                Text(""),
                                ButtonTheme(
                                  minWidth: 14,
                                  height: 20,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    textColor: Colors.black,
                                    color: Colors.white,
                                    child: Text(
                                      "Reorder",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Text("loading");
                },
              ),
            
            ],
          ),
        ));
  }
}
