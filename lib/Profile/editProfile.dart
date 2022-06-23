import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Home/keranjang.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
    required this.nama,
    required this.email,
    required this.no_telp,
    required this.tgl_lahir,
    required this.alamat,
  }) : super(key: key);
  final String nama;
  final String email;
  final String no_telp;
  final String tgl_lahir;
  final String alamat;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 246, 255),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ACCOUNT",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyKeranjang(),
                ),
              );
            },
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.black,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ProfileEdit(
        nama: widget.nama,
        email: widget.email,
        no_telp: widget.no_telp,
        tgl_lahir: widget.tgl_lahir,
        alamat: widget.alamat,
      ),
    );
  }
}

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({
    Key? key,
    required this.nama,
    required this.email,
    required this.no_telp,
    required this.tgl_lahir,
    required this.alamat,
  }) : super(key: key);
  final String nama;
  final String email;
  final String no_telp;
  final String tgl_lahir;
  final String alamat;

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController tgl_lahirC = TextEditingController();

  void _doEdit() async {
    try {
      var collection = FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      var res = await collection.set(
        {
          'nama': (namaC.text == '') ? widget.nama : namaC.text,
          'email': (emailC.text == '') ? widget.email : emailC.text,
          'no_telp': (noHpC.text == '') ? widget.no_telp : noHpC.text,
          'alamat': (alamatC.text == '') ? widget.alamat : alamatC.text,
          'tgl_lahir':
              (tgl_lahirC.text == '') ? widget.tgl_lahir : tgl_lahirC.text,
        },
        SetOptions(merge: true),
      );
      print('simpan firestore');
      //print(res);
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaC.text = widget.nama;
    emailC.text = widget.email;
    noHpC.text = widget.no_telp;
    tgl_lahirC.text = widget.tgl_lahir;
    alamatC.text = widget.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Nama",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              //initialValue: widget.nama,
              maxLength: 25,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              autocorrect: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: "Masukkan nama",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: namaC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Email",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              //initialValue: widget.email,
              maxLength: 30,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              autocorrect: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: "Masukkan email",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: emailC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "No. Hp",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              maxLength: 13,
              //initialValue: widget.no_telp,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              autocorrect: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: "Masukkan no.Hp",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: noHpC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Alamat",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              maxLength: 75,
              //initialValue: widget.no_telp,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              autocorrect: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                hintText: "Masukkan Alamat",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: alamatC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Text(
              "Tanggal Lahir",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Stack(
            children: <Widget>[
              DateTimePicker(
                //initialValue: widget.tgl_lahir,
                firstDate: DateTime(1950),
                lastDate: DateTime(2100),
                dateLabelText: 'Pilih tanggal lahir',
                controller: tgl_lahirC,
                validator: (v) {
                  print(v);
                  return null;
                },
                onSaved: (v) => print(v),
              )
            ],
          ),
          _buildBtn(),
        ],
      ),
    );
  }

  Container _buildBtn() {
    return Container(
      padding: EdgeInsets.only(left: 130, right: 130, top: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textColor: Colors.white,
        color: Color.fromARGB(255, 255, 89, 37),
        child: Text(
          "SIMPAN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: const Text('Apakah anda yakin ingin menyimpan ?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    _doEdit();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
