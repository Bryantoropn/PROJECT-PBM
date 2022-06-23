import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login/login.dart';

class FormRegis extends StatefulWidget {
  const FormRegis({Key? key, required this.res}) : super(key: key);
  final UserCredential res;

  @override
  State<FormRegis> createState() => _FormRegisState();
}

class _FormRegisState extends State<FormRegis> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController tgllhr = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController createdAt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.text = widget.res.user!.email!;
  }

  void _doRegistForm() async {
    var collection =
        FirebaseFirestore.instance.collection('user').doc(widget.res.user!.uid);
    try {
      var res = await collection.set({
        'nama': nama.text,
        'email': email.text,
        'no_telp': noHp.text,
        'alamat': alamat.text,
        'tgl_lahir': tgllhr.text,
        'createdAt': Timestamp.now(),
      });
      print('simpan firestore');
      //print(res);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: const Text(
            'Akun berhasil ditambahkan, silakan untuk login',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myLogin(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Gagal menyimpan'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 247, 246, 255)),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 70),
                  child: Image.asset('./images/logo.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'MaemsApp',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Food and Delivery'),
                    ],
                  ),
                ),
                _buildFormRegistrasi(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBtn() {
    return Container(
      padding: EdgeInsets.only(left: 110, right: 110, top: 20),
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
                    _doRegistForm();
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

  Widget _buildEmail() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
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
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        controller: email,
      ),
    );
  }

  Widget _buildNama() {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
        child: TextFormField(
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
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.blue))),
          controller: nama,
        ));
  }

  Widget _buildNoHp() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        maxLength: 30,
        style: TextStyle(color: Colors.black),
        textInputAction: TextInputAction.done,
        obscureText: false,
        autocorrect: true,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: "Masukkan noHp",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        controller: noHp,
      ),
    );
  }

  Widget _buildAlamat() {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: TextFormField(
          maxLength: 25,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: false,
          autocorrect: true,
          cursorColor: Colors.red,
          decoration: InputDecoration(
              hintText: "Masukkan Alamat",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.blue))),
          controller: alamat,
        ));
  }

  Widget _buildtgllhr() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Stack(
        children: <Widget>[
          DateTimePicker(
            firstDate: DateTime(1950),
            lastDate: DateTime(2100),
            dateLabelText: 'Pilih tanggal lahir',
            controller: tgllhr,
            validator: (v) {
              print(v);
              return null;
            },
            onSaved: (v) => print(v),
          )
        ],
      ),
    );
  }

  Widget _buildFormRegistrasi() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNama(),
            _buildEmail(),
            _buildNoHp(),
            _buildAlamat(),
            _buildtgllhr(),
            _buildBtn(),
          ],
        ),
      ),
    );
  }
}
