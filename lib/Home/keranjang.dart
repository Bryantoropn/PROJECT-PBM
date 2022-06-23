import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:per4/Home/keranjang_card.dart';
import 'package:per4/Widget/PageAppBar.dart';

class MyKeranjang extends StatelessWidget {
  MyKeranjang({Key? key}) : super(key: key);

  final keranjang = FirebaseFirestore.instance
      .collection("keranjang")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("list");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: keranjang.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("Keranjang kosong"),
              );
            } else {
              var data = snapshot.data!.docs;
              return ListView(
                children: data.map((e) {
                  return KeranjangCard(
                    nama: e['nama_makanan'],
                    harga: e['harga'],
                    id: e.id,
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
    );
  }
}
