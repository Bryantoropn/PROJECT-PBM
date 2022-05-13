import 'package:flutter/material.dart';
import 'package:per4/PageAppBar.dart';
//import 'package:qrscan/qrscan.dart' as scanner;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/src/qr_scanner_overlay_shape.dart';

class MyScanQr extends StatefulWidget {
  const MyScanQr({Key? key}) : super(key: key);

  @override
  State<MyScanQr> createState() => _MyScanQrState();
}

class _MyScanQrState extends State<MyScanQr> {
  String text = 'Hasil Qr Code';
  GlobalKey _qrKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Stack(
        children: [
          QRView(
              key: _qrKey, onQRViewCreated: (QRViewController controller) {}),
          //     child: Center(
          //   child: Text(text),)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              child: Center(
                child: IconButton(
                  onPressed: () async {},
                  icon: Icon(Icons.camera),
                  iconSize: 50,
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 246, 255),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
              ),
              // decoration: BoxDecoration(),
            ),
          )
        ],
      ),
    );
  }
}
