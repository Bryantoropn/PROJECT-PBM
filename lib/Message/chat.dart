import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {
  const MyChat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
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
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: Chat(),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your Chats",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 247, 246, 255),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 196, 196, 196))),
                ),
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 15,
              thickness: 1,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
                maxRadius: 25,
              ),
              title: const Text(
                'Mr. Maems',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text("You have a message...", style: TextStyle(fontSize: 12)),
              trailing: Text("16:30"),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 70,
              endIndent: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
                maxRadius: 25,
              ),
              title: const Text(
                'Mr. Maems',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text("You have a message...", style: TextStyle(fontSize: 12)),
              trailing: Text("Yesterday"),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 70,
              endIndent: 10,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(right: 4, left: 4),
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
                maxRadius: 25,
              ),
              title: const Text(
                'Mr. Maems',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text("You have a message...", style: TextStyle(fontSize: 12)),
              trailing: Text("16/03/2022"),
            ),
            Divider(
              color: Color.fromARGB(255, 196, 196, 196),
              height: 5,
              thickness: 1,
              indent: 70,
              endIndent: 10,
            ),
          ],
        ));
  }
}
