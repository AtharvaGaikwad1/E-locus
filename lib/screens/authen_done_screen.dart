import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dis extends StatefulWidget {
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  static const _intialpos = CameraPosition(
    target: LatLng(21.08760, 79.06395),
    zoom: 11.2,
  );

  @override
  State<Dis> createState() => _DisState();
}

class _DisState extends State<Dis> {
  Completer<GoogleMapController> _controller = Completer();
  static final Marker _gmarker = Marker(
      markerId: MarkerId('_ini'),
      infoWindow: InfoWindow(title: "charging station 1"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(21.08760, 79.06395));
  static final Marker _tataStation = Marker(
      markerId: MarkerId('_ini'),
      infoWindow: InfoWindow(title: "charging station 1"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(21.13805, 79.00483));
  static final Marker ch3 = Marker(
      markerId: MarkerId('_ini'),
      infoWindow: InfoWindow(title: "charging station 1"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(21.08327, 79.06350));
  static final Marker ch4 = Marker(
      markerId: MarkerId('_ini'),
      infoWindow: InfoWindow(title: "charging station 1"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(21.15939, 79.07806));
  static final Marker ch5 = Marker(
      markerId: MarkerId('charing station 5'),
      infoWindow: InfoWindow(
        title: "charging station 5",
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(21.12503, 79.04156));

  // void _onMapCreated(GoogleMapController controller) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: GoogleMap(
        markers: {_gmarker, _tataStation, ch3, ch4, ch5},
        mapType: MapType.normal,
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: Dis._intialpos,
      ),
    );
  }
}
