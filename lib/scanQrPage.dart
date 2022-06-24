import 'package:flutter/material.dart';
import 'package:per4/Widget/PageAppBar.dart';
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
  late QRViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Stack(
        children: [
          QRView(
              key: _qrKey,
              overlay: QrScannerOverlayShape(
                  borderColor: Color.fromARGB(255, 0, 0, 0)),
              onQRViewCreated: (QRViewController controller) {
                this._controller = controller;
                controller.scannedDataStream.listen((event) {
                  if (mounted) {
                    _controller.dispose();
                    Navigator.pop(context, event);
                  }
                });
              }),
          //     child: Center(
          //   child: Text(text),)
        ],
      ),
    );
  }
}
