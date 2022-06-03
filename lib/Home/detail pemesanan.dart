import 'package:flutter/material.dart';
import 'package:per4/Home/home.dart';
import 'package:per4/NavBarHome.dart';
import 'package:per4/Widget/PageAppBar.dart';
import 'package:per4/Profile/editProfile.dart';
import 'package:per4/Profile/Top%20Up/topUp.dart';
import '../Profile/feedback.dart';
import '../Login/Regis/login.dart';
import 'keranjang.dart';

class DetailPemesanan extends StatelessWidget {
  const DetailPemesanan({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "MAEMS APP",
              style: TextStyle(color: Colors.black),
            ),
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
      ),
      body: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPemesanan()));
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
              Expanded(
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
                            Text("Pesananmu akan tiba dalam 20 menit",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400)),
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
                            Text(
                              "Mr. Maemes",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text("Rating", style: TextStyle(fontSize: 12)),
                            Row(
                              children: [
                                Text("4,5", style: TextStyle(fontSize: 12)),
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Color.fromARGB(255, 255, 169, 39),
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
                              "Jl. Pattimura no 2",
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
                "Nasi Goreng",
                style: TextStyle(fontSize: 14),
              ),
              Text("1x")
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
                                child: Text("Rp. 32.000",
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
                                child: Text("Rp. 3.000",
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
                                child: Text("Rp. 42.000",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold))),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomWidgetHome()));
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
