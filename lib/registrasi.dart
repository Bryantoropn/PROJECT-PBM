import 'package:flutter/material.dart';
import 'package:per4/main.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

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
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text('Food and Delivery'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Email or no.Telp...',
                        hintText: 'Enter your email or no.telp'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Username...',
                        hintText: 'Enter your username'),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 10),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: 'Password...',
                          hintText: 'Enter your secure Password'),
                    )),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 255, 89, 37),
                    child: Text(
                      "Register",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: const Text(
                                  'Akun berhasil ditambahkan'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                myLogin()));
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            )),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Sudah punya akun ?'),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => myLogin()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 23, 143, 253)),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
