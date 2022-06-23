import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:per4/Home/detail%20pemesanan.dart';
import 'package:per4/NavBarHome.dart';
import 'package:per4/map/directions_model.dart';

import '../Home/keranjang.dart';

class MyMaps extends StatefulWidget {
  const MyMaps({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(-7.250445, 112.768845), zoom: 15);

  CollectionReference driver = FirebaseFirestore.instance.collection('driver');
  late GoogleMapController _googleMapController;
  late QueryDocumentSnapshot dataDriver;
  final Marker _origin = Marker(
    markerId: MarkerId('origin'),
    infoWindow: InfoWindow(title: 'Maems Store'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(-7.252978, 112.766635),
  );
  Marker? _destination;
  Directions? _info;
  Location location = Location();
  LatLng? locPosition;

  void getUserLocation() async {
    location.onLocationChanged.listen((LocationData currentLocation) {
      locPosition = LatLng(
        currentLocation.latitude as double,
        currentLocation.longitude as double,
      );
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Future<QueryDocumentSnapshot> getDriverOrder() async {
    var data = await driver.get();
    var data2 = data.docs;
    dataDriver = data2.firstWhere((docu) {
      return docu.id == widget.doc['id_driver'];
    });
    return dataDriver;
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 246, 255),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomWidgetHome(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin as Marker,
              if (_destination != null) _destination as Marker,
            },
          ),
          if (_info != null)
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ]),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 400,
              height: 300,
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                onPressed: () => _googleMapController.animateCamera(_info !=
                        null
                    ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
                    : CameraUpdate.newCameraPosition(_initialCameraPosition)),
                child: Icon(Icons.center_focus_strong),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 380,
              height: 185,
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery details",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPemesanan(doc: widget.doc),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.arrow_drop_up,
                              size: 24,
                              color: Colors.white,
                            ),
                            backgroundColor: Color.fromARGB(255, 196, 196, 196),
                            maxRadius: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            child: Icon(
                              Icons.delivery_dining,
                              size: 24,
                              color: Colors.white,
                            ),
                            backgroundColor: Color.fromARGB(255, 196, 196, 196),
                            maxRadius: 20,
                          ),
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
                                Text(
                                  "Driver telah tiba di restoran maems",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Pesananmu akan tiba dalam 20 menit",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 196, 196, 196),
                    height: 5,
                    thickness: 1,
                    indent: 20,
                    endIndent: 23,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 196, 196, 196),
                                  maxRadius: 20,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: FutureBuilder<QueryDocumentSnapshot>(
                                    future: getDriverOrder(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!['nama_driver'],
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              snapshot.data!['no_telp'],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data!['rating'],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  size: 14,
                                                  color: Color.fromARGB(
                                                    255,
                                                    255,
                                                    169,
                                                    39,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      } else {
                                        return SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.chat,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 196, 196, 196),
                                  maxRadius: 16,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.call,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 196, 196, 196),
                                maxRadius: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
