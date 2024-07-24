import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_attendance_test/core/bloc/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState()) {
    log("Initial current location");
    // getCurrentLocation();
  }

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

  Future<void> getCurrentLocation() async {
    final isServiceEnabled = await _checkLocationService();

    if (!isServiceEnabled) {
      log("Enable service & permission first!");
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    log("Lang: ${position.latitude}, Long: ${position.longitude}");

    emit(
      state.copyWith(
        langitude: position.latitude,
        longitude: position.longitude,
      ),
    );
  }
}
