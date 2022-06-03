import 'package:flutter/material.dart';
import 'package:per4/Home/keranjang.dart';
import 'package:simple_shadow/simple_shadow.dart';

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
          SimpleShadow(
            child: Image.asset('image/maems.png'),
            opacity: 0.6,
            color: Color.fromARGB(255, 67, 67, 67),
            offset: Offset(0, 3),
            sigma: 2,
          )
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
