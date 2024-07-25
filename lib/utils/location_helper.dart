import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';

class LocationHelper {
  Future<bool> checkAndEnableAllPermission() async {
    log("Checking location service");

    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      log("Location service is disabled");
      return Geolocator.openLocationSettings();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      log("Location service is denied");
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        log("Location service is denied again");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("Location service is denied permanently");
      return false;
    }

    return true;
  }

  Future<LatLng?> getCurrentLocation() async {
    final isServiceEnabled = await checkAndEnableAllPermission();

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

    return masterLocation;
  }

  Future<List<Placemark>> getAddressFromPosition(LatLng? position) async {
    final placemarks = await placemarkFromCoordinates(
      position?.latitude ?? 0,
      position?.longitude ?? 0,
    );

    log("Addresses: ${placemarks.map((e) => e.toJson()).toList()}");

    return placemarks;
  }

  Future<BitmapDescriptor> getCustomMarkerIcon(String path) async {
    final assetImage = BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      path,
    );

    return assetImage;
  }

  static LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  static Stream<Position> positionStream =
      Geolocator.getPositionStream(locationSettings: locationSettings);
}
