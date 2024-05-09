import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap extends StatefulWidget {
  const MyGoogleMap({super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  GoogleMapController? GMC;
 final List<Marker> _markers = [
  const  Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(31.401955, 34.327726),
      infoWindow: InfoWindow(
        title: 'GAZA',
        snippet: 'A beautiful city',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        title: Text('Google Maps in Flutter'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: FittedBox(
                child: FloatingActionButton.extended(
                  heroTag: "join",
                  onPressed: () {},
                  label:const Text(
                    "get the location",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                ),
              ),
            ),
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target:
              LatLng(31.401955, 34.327726), // Default position (San Francisco)
          zoom: 12.0,
        ),
        markers: _markers.toSet(),
        onTap: (LatLng latLng) {
          _markers.add(Marker(
              markerId: MarkerId("${latLng.latitude}"),
              position: LatLng(latLng.latitude, latLng.longitude)));
          setState(() {});
        },
        onMapCreated: (controller) {
          GMC = controller;
        },
      ),
    );
  }
}
