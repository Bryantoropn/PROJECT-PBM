import 'package:flutter/material.dart';
import 'package:per4/Home/keranjang.dart';

class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
