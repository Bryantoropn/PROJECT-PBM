import 'package:flutter/material.dart';
import 'package:per4/Profile/Top%20Up/topUp.dart';

import '../../Home/keranjang.dart';

class konfirmTopUp extends StatelessWidget {
  const konfirmTopUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 246, 255),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
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
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top up amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Rp. 20.000",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 89, 37)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 5),
                    child: Text(
                      "Top up detail",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Top up amount"),
                        ),
                        Container(
                            child: Text("Rp. 20.000",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 89, 37),
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
                          child: Text("Fee"),
                        ),
                        Container(
                            child: Text("Rp. 1.000",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 89, 37),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 196, 196, 196),
                    height: 10,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Total"),
                        ),
                        Container(
                            child: Text("Rp. 1.000",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 89, 37),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 35),
              child: Column(
                children: [
                  Container(
                    child: Divider(
                      color: Color.fromARGB(255, 196, 196, 196),
                      height: 10,
                      thickness: 3,
                      indent: 1,
                      endIndent: 1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(right: 4, left: 4),
                      leading: Icon(
                        Icons.credit_card,
                        size: 35,
                      ),
                      title: const Text(
                        'Top up',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Select a top up method",
                          style: TextStyle(fontSize: 12)),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 16,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Confirm & Top up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  "Rp.21.000",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 89, 37),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('Apakah anda yakin ?'),
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
                                        builder: (context) => myTopUp()));
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
