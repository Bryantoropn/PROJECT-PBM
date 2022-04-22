import 'package:flutter/material.dart';
import 'package:per4/main.dart';
import 'package:per4/home.dart';
import 'package:per4/bottomNav.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: History(),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "This Month",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "07 Mar 2022, 13:10",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(""),
                                Text(
                                  "Your rating",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text("4,5"),
                                    Icon(
                                      Icons.star,
                                      size: 20,
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
                  Column(
                    children: [
                      Text("Rp. 32.000",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 255, 89, 37))),
                      Text(""),
                      ButtonTheme(
                        minWidth: 14,
                        height: 20,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Reorder",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "07 Mar 2022, 13:10",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(""),
                                Text(
                                  "Your rating",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text("4,5"),
                                    Icon(
                                      Icons.star,
                                      size: 20,
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
                  Column(
                    children: [
                      Text("Rp. 32.000",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 255, 89, 37))),
                      Text(""),
                      ButtonTheme(
                        minWidth: 14,
                        height: 20,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Reorder",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "This Month",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "07 Mar 2022, 13:10",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(""),
                                Text(
                                  "Your rating",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text("4,5"),
                                    Icon(
                                      Icons.star,
                                      size: 20,
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
                  Column(
                    children: [
                      Text("Rp. 32.000",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 255, 89, 37))),
                      Text(""),
                      ButtonTheme(
                        minWidth: 14,
                        height: 20,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Reorder",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "07 Mar 2022, 13:10",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(""),
                                Text(
                                  "Your rating",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Row(
                                  children: [
                                    Text("4,5"),
                                    Icon(
                                      Icons.star,
                                      size: 20,
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
                  Column(
                    children: [
                      Text("Rp. 32.000",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 255, 89, 37))),
                      Text(""),
                      ButtonTheme(
                        minWidth: 14,
                        height: 20,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          textColor: Colors.black,
                          color: Colors.white,
                          child: Text(
                            "Reorder",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
