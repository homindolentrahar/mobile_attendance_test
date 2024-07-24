import 'dart:async';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';

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

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    log("Lang: ${position.latitude}, Long: ${position.longitude}");

    return LatLng(position.latitude, position.longitude);
  }

  Future<LatLng?> getMasterLocation() async {
    final appSettingBox =
        LocalStorageHelper.getBox(LocalConstants.appSettingBox);
    final savedMasterLocation =
        await appSettingBox.get(LocalConstants.masterLocationKey);
    LatLng? masterLocation;

    if (savedMasterLocation != null) {
      masterLocation = LatLng(
        savedMasterLocation['latitude'] ?? 0,
        savedMasterLocation['longitude'] ?? 0,
      );
    }

    log("Lang: ${masterLocation?.latitude}, Long: ${masterLocation?.longitude}");

    return masterLocation ?? const LatLng(0, 0);
  }

  Future<List<Placemark>> getAddressFromPosition(LatLng? position) async {
    final placemarks = await placemarkFromCoordinates(
      position?.latitude ?? 0,
      position?.longitude ?? 0,
    );

    log("Addresses: ${placemarks.map((e) => e.toJson()).toList()}");

    return placemarks;
  }

  static LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  static StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position? position) {
      log(position == null
          ? 'Position unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    },
  );
}
