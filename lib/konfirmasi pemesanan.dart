import 'package:flutter/material.dart';
import 'package:per4/map/maps.dart';
import 'package:per4/topUp.dart';

class konfirmPemesanan extends StatelessWidget {
  const konfirmPemesanan({Key? key}) : super(key: key);
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
              onPressed: () {},
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Delivery Address",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Jl. Pattimura no 2",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ),
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
                                  "Change",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {}),
                          )
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
                            "Notes",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                    Divider(
                      color: Color.fromARGB(255, 196, 196, 196),
                      height: 5,
                      thickness: 1,
                      indent: 2,
                      endIndent: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Delivery",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text("Select order type",
                                            style: TextStyle(fontSize: 12))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                            maxRadius: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 10,
                thickness: 5,
                indent: 1,
                endIndent: 1,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            "Add items",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            child:
                                Image(image: AssetImage("./image/nasgor.png")),
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
                                    "Notes: Kecap sedikit",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  ButtonTheme(
                                    minWidth: 14,
                                    height: 20,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        textColor: Colors.black,
                                        color: Colors.white,
                                        child: Text(
                                          "Edit",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {}),
                                  ),
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
                        Text("1x", style: TextStyle(fontSize: 12)),
                        Text(""),
                        Text(""),
                        Text(""),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                child: Column(
                  children: [
                    Divider(
                      color: Color.fromARGB(255, 196, 196, 196),
                      height: 5,
                      thickness: 1,
                      indent: 1,
                      endIndent: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 1, right: 9, top: 5),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text("Subtotal"),
                                  ),
                                  Container(
                                      child: Text("Rp. 32.000",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 89, 37),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text("Delivery fee"),
                                  ),
                                  Container(
                                      child: Text("Rp. 7.000",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 89, 37),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text("Platform fee"),
                                  ),
                                  Container(
                                      child: Text("Rp. 3.000",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 89, 37),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text("Total"),
                                  ),
                                  Container(
                                      child: Text("Rp. 42.000",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 89, 37),
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: ButtonTheme(
                  minWidth: 14,
                  height: 20,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Text(
                        "Use voucher",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {}),
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
                          'Payment',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Select payment method",
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
                              "Order",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    "Rp.42.000",
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
                                  backgroundColor:
                                      Color.fromARGB(255, 196, 196, 196),
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
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyMaps()));
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
          ),
        ));
  }
}
