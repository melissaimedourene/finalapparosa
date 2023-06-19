import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  late GoogleMapController _controller;
  final LatLng _markerLocation = LatLng(48.8566, 2.3522); // Paris coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Page'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: _markerLocation,
          zoom: 12,
        ),
        markers: <Marker>[
          Marker(
            markerId: MarkerId('Marker1'),
            position: _markerLocation,
            infoWindow: InfoWindow(
              title: 'Paris',
              snippet: 'The City of Light',
            ),
          ),
        ].toSet(),
      ),
    );
  }
}
