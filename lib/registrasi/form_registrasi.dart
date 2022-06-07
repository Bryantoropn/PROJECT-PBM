import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login/login.dart';

class FormRegis extends StatefulWidget {
  const FormRegis({Key? key}) : super(key: key);

  @override
  State<FormRegis> createState() => _FormRegisState();
}

class _FormRegisState extends State<FormRegis> {
  var nama = '';
  var email = '';
  var noHp = '';
  var tgllhr = '';
  var createdAt = '';
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
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                    var collection =
                        FirebaseFirestore.instance.collection('user');
                    var res = await collection.add({
                      'nama': nama,
                      'email': email,
                      'nohp': noHp,
                      'tgllhr': tgllhr,
                      'createdAt' : Timestamp.now()
                    });
                    print('simpan firestore');
                    print(res);
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text(
                            'Akun berhasil ditambahkan, silakan untuk login'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myLogin()));
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
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
                borderSide: BorderSide(color: Colors.blue))),
        onChanged: (v) {
          email = v;
        },
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
          onChanged: (v) {
            nama = v;
          },
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
                borderSide: BorderSide(color: Colors.blue))),
        onChanged: (v) {
          noHp = v;
        },
      ),
    );
  }

  Widget _buildtgllhr() {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: <Widget>[
            DateTimePicker(
              initialValue: '',
              firstDate: DateTime(1950),
              lastDate: DateTime(2100),
              dateLabelText: 'Pilih tanggal lahir',
              onChanged: (v) {
                tgllhr = v;
              },
              validator: (v) {
                print(v);
                return null;
              },
              onSaved: (v) => print(v),
            )
          ],
        ));
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
            _buildtgllhr(),
            _buildBtn(),
          ],
        ),
      ),
    );
  }

}