import 'package:flutter/material.dart';
import 'package:per4/Home/konfirmasi%20pemesanan.dart';
import 'package:per4/Widget/PageAppBar.dart';

class MyKeranjang extends StatelessWidget {
  const MyKeranjang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: History(),
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 196, 196, 196),
                      ),
                      backgroundColor: Colors.white,
                      maxRadius: 18,
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
                            Text("Deliver to", style: TextStyle(fontSize: 12)),
                            Text(
                              "Jl. Pattimura no 2",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
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
          height: 10,
          thickness: 5,
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Image(image: AssetImage("./image/nasgor.png")),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nasi Goreng",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Notes: Kecap sedikit",
                              style: TextStyle(
                                  fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                            Text("Rp. 32.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 255, 89, 37))),
                            Row(
                              children: [
                                Text("1x"),
                                ButtonTheme(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  minWidth: 10,
                                  height: 16,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {}),
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
              Column(
                children: [
                  Text(""),
                  Text(""),
                  Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
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
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Image(image: AssetImage("./image/nasgor.png")),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nasi Goreng",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Notes: Kecap sedikit",
                              style: TextStyle(
                                  fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                            Text("Rp. 32.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 255, 89, 37))),
                            Row(
                              children: [
                                Text("1x"),
                                ButtonTheme(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  minWidth: 10,
                                  height: 16,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {}),
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
              Column(
                children: [
                  Text(""),
                  Text(""),
                  Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
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
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Image(image: AssetImage("./image/nasgor.png")),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nasi Goreng",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Notes: Kecap sedikit",
                              style: TextStyle(
                                  fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                            Text("Rp. 32.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 255, 89, 37))),
                            Row(
                              children: [
                                Text("1x"),
                                ButtonTheme(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  minWidth: 10,
                                  height: 16,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      textColor: Colors.black,
                                      color: Colors.white,
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {}),
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
              Column(
                children: [
                  Text(""),
                  Text(""),
                  Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 196, 196, 196),
          height: 10,
          thickness: 5,
        ),
        Container(
          padding: EdgeInsets.only(left: 50, right: 50, top: 15),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Confirm",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Rp.32.000",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 89, 37),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: Colors.black,
                      ),
                      backgroundColor: Color.fromARGB(255, 196, 196, 196),
                      maxRadius: 8,
                    ),
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
                              builder: (context) => konfirmPemesanan()));
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
