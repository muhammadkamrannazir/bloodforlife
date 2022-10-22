// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> controllerGoogleMap = Completer();
    GoogleMapController? googleMapController;

    final CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    Set<Marker> markers = {};

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        tooltip: 'Locator',
        backgroundColor: Colors.teal,
        child:
            // Text('Locate', style: TextStyle(fontWeight: FontWeight.bold)),
            Icon(Icons.my_location_rounded),
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();
          markers.add(
            Marker(
              markerId: MarkerId('Current Location'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );
          setState(() {});
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              markers: markers,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                controllerGoogleMap.complete(controller);
                googleMapController = controller;
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
