import 'package:flutter/material.dart';
import 'package:per4/Makanan/makanan_tile.dart';
import '../Widget/PageAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('makanan').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.docs;
                  return Column(
                    children: data.map((doc) {
                      return MakananTile(
                        nama: doc['nama_makanan'],
                        harga: doc['harga'],
                        rating: doc['rating'],
                        id: doc.id,
                      );
                    }).toList(),
                  );
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
    );
  }
}
