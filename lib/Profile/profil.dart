import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:per4/Profile/editProfile.dart';
import 'package:per4/Profile/Top%20Up/topUp.dart';
import 'package:per4/Widget/PageAppBar.dart';
import 'feedback.dart';
import '../Login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    final String documentId = FirebaseAuth.instance.currentUser!.uid;
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 196, 196, 196),
                        maxRadius: 25,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      StreamBuilder<DocumentSnapshot>(
                        stream: users.doc(documentId).snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data;
                            return Expanded(
                              child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data!['nama'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        data['no_telp'],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        data['email'],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else {
                            return Text("Loading...");
                            // return Center(
                            //   child: LinearProgressIndicator(),
                            // );
                          }
                        },
                      ),
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
                      "Edit",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      var userData = await users.doc(documentId).get();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(
                            nama: userData['nama'],
                            email: userData['email'],
                            no_telp: userData['no_telp'],
                            tgl_lahir: userData['tgl_lahir'],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 196, 196, 196),
            height: 5,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saldo",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp. 50.000",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 89, 37),
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.qr_code,
                        color: Colors.black,
                      ),
                      onPressed: () {},
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
                          "Top Up",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => myTopUp(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 255, 255, 255),
            height: 5,
            thickness: 6,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 4, left: 4),
            title: const Text(
              'PIN Settings',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 196, 196, 196),
            height: 5,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 4, left: 4),
            title: const Text(
              'Language',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 196, 196, 196),
            height: 5,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 4, left: 4),
            title: const Text(
              'Invite Friends',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 255, 255, 255),
            height: 5,
            thickness: 6,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 4, left: 4),
            title: const Text(
              'Terms of Service',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 196, 196, 196),
            height: 5,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 4, left: 4),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 196, 196, 196),
            height: 5,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(right: 4, left: 4),
            title: const Text(
              'Help Center',
              style: TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFeedback()));
              },
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 196, 196, 196),
            height: 5,
            thickness: 1,
            indent: 12,
            endIndent: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: Colors.white,
              color: Color.fromARGB(255, 255, 89, 37),
              child: Text(
                "LOGOUT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('Apakah anda yakin ingin keluar?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
