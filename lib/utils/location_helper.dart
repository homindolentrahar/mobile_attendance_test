import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationHelper {
  Future<bool> _checkLocationService() async {
    log("Checking location service");
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      log("Location service is disabled");

      return Geolocator.openLocationSettings().then((value) async {
        log("From settings");
        return await _checkLocationService();
      });
    }

    return true & await _checkLocationPermission();
  }

  Future<bool> _checkLocationPermission() async {
    log("Checking location permission");
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      log("Location permission is denied");
      permission = await Geolocator.requestPermission();
      return false;
    }

    if (permission == LocationPermission.deniedForever) {
      log("Location permission is denied permanently");
      return false;
    }

    return true;
  }

  Future<LatLng?> getCurrentLocation() async {
    final isServiceEnabled = await _checkLocationService();

    if (!isServiceEnabled) {
      log("Enable service & permission first!");
      return null;
    }

    final position = await Geolocator.getCurrentPosition();
    log("Lang: ${position.latitude}, Long: ${position.longitude}");

    return LatLng(position.latitude, position.longitude);
  }
}
