import 'package:flutter/material.dart';
import 'package:per4/Profile/Top%20Up/konfirmasiTopUp.dart';
import '../../NavBarProf.dart';

class myTopUp extends StatelessWidget {
  const myTopUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 246, 255),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomWidgetProf()));
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
      body: TopUp(),
    );
  }
}

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Choose an amount",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              Text(
                                "Rp. 10.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              Text(
                                "Rp. 20.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              Text(
                                "Rp. 50.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              Text(
                                "Rp. 100.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              Text(
                                "Rp. 150.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.attach_money,
                                color: Colors.yellow,
                              ),
                              Text(
                                "Rp. 200.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 100, right: 100, top: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Center(
                        child: Text(
                          "Or, type the amount",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(left: 50, right: 50, top: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 255, 89, 37),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => konfirmTopUp()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
