import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:per4/map/maps.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../Widget/PageAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Home/keranjang.dart';
import 'order_history_tile.dart';
import 'reservasi_history_tile.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 247, 246, 255),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleShadow(
                child: Image.asset('image/maems.png'),
                opacity: 0.6,
                color: Color.fromARGB(255, 67, 67, 67),
                offset: Offset(0, 3),
                sigma: 2,
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyKeranjang()));
              },
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.black,
            )
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: "Order"),
              Tab(text: "Reservasi"),
            ],
          ),
        ),
        body: History(),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  CollectionReference menu =
      FirebaseFirestore.instance.collection('pemesanan_makanan');
  CollectionReference reservasi =
      FirebaseFirestore.instance.collection('pemesanan_reservasi');
  // CollectionReference driver =
  //     FirebaseFirestore.instance.collection('driver');
  var id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "This Month",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: menu.where('id_user', isEqualTo: id).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text("No History"),
                        );
                      } else {
                        var data = snapshot.data!.docs;
                        return Column(
                          children: data.map((doc) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MyMaps(doc: doc);
                                    },
                                  ),
                                );
                              },
                              child: OrderHistoryTile(
                                nama: doc['nama_makanan'],
                                total: doc['total'],
                              ),
                            );
                          }).toList(),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "This Month",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: reservasi.where('id_user', isEqualTo: id).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text("No History"),
                        );
                      } else {
                        var data = snapshot.data!.docs;
                        return Column(
                          children: data.map((doc) {
                            return ReservasiHistoryTile(
                              nama: doc['nama_reservasi'],
                              tanggal: doc['tgl_reservasi'],
                            );
                          }).toList(),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Column(
    //     //mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Align(
    //         alignment: Alignment.topLeft,
    //         child: Text(
    //           "This Month",
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    //         ),
    //       ),
    //       StreamBuilder<QuerySnapshot>(
    //         stream: menu.where('id_user', isEqualTo: id).snapshots(),
    //         builder: (context, snapshot) {
    //           if (snapshot.hasData) {
    //             if (snapshot.data!.docs.isEmpty) {
    //               return Center(
    //                 child: Text("No History"),
    //               );
    //             } else {
    //               var data = snapshot.data!.docs;
    //               return ListView(
    //                 shrinkWrap: true,
    //                 children: data.map((doc) {
    //                   return HistoryTile(
    //                     nama: doc['nama_makanan'],
    //                     total: doc['total'],
    //                   );
    //                 }).toList(),
    //               );
    //             }
    //           } else if (snapshot.hasError) {
    //             return Text("${snapshot.error}");
    //           } else {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
