import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:mobile_attendance_test/model/geofence_data_model.dart';
import 'package:rxdart/rxdart.dart';

class GeofenceData {
  final Geofence geofence;
  final GeofenceRadius radius;
  final GeofenceStatus status;

  GeofenceData({
    required this.geofence,
    required this.radius,
    required this.status,
  });
}

class GeofenceHelper {
  GeofenceService? _geofenceService;
  static GeofenceHelper? _instance;
  final StreamController<GeofenceData> geofenceStreamController =
      BehaviorSubject<GeofenceData>();

  GeofenceHelper._() {
    _geofenceService = _setupGeofence();
  }

  factory GeofenceHelper() {
    _instance ??= GeofenceHelper._();

    return _instance!;
  }

  bool isRunning() => _geofenceService?.isRunningService ?? false;

  GeofenceService _setupGeofence() {
    final geofenceService = GeofenceService.instance.setup(
      interval: 2000,
      statusChangeDelayMs: 2000,
      printDevLog: kDebugMode,
      useActivityRecognition: false,
    );

    return geofenceService;
  }

  void addGeofence(GeofenceDataModel model) {
    _geofenceService?.addGeofence(
      Geofence(
        id: model.id,
        latitude: model.latitude,
        longitude: model.longitude,
        data: model.data,
        radius: model.radius
            .map(
              (e) => GeofenceRadius(
                id: e.id,
                length: e.radius,
                data: e.data,
              ),
            )
            .toList(),
      ),
    );
  }

  void removeGeofence(String id) {
    _geofenceService?.removeGeofenceById(id);
  }

  void resume() async {
    _geofenceService?.resume();
  }

  void pasue() async {
    _geofenceService?.pause();
  }

  Future<void> startGeofencingService() async {
    _geofenceService?.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService?.addLocationChangeListener(_onLocationChanged);
    _geofenceService?.addLocationServicesStatusChangeListener(
        _onLocationServicesStatusChanged);
    _geofenceService?.addActivityChangeListener(_onActivityChanged);
    _geofenceService?.addStreamErrorListener(_onError);

    _geofenceService?.start().catchError(_onError);
  }

  Future<void> stopGeofencingService() async {
    _geofenceService
        ?.removeGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    _geofenceService?.removeLocationChangeListener(_onLocationChanged);
    _geofenceService?.removeLocationServicesStatusChangeListener(
        _onLocationServicesStatusChanged);
    _geofenceService?.removeActivityChangeListener(_onActivityChanged);
    _geofenceService?.removeStreamErrorListener(_onError);
    _geofenceService?.clearAllListeners();
    return _geofenceService?.stop();
  }

  Future<void> _onGeofenceStatusChanged(
    Geofence geofence,
    GeofenceRadius radius,
    GeofenceStatus status,
    Location location,
  ) async {
    log('geofence: ${geofence.toJson()}');
    log('geofenceRadius: ${radius.toJson()}');
    log('geofenceStatus: ${status.toString()}');

    geofenceStreamController.sink.add(
      GeofenceData(
        geofence: geofence,
        radius: radius,
        status: status,
      ),
    );
  }

  void _onActivityChanged(
    Activity prevActivity,
    Activity currActivity,
  ) {
    log('prevActivity: ${prevActivity.toJson()}');
    log('currActivity: ${currActivity.toJson()}');
    // _activityStreamController.sink.add(currActivity);
  }

// This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    log('Location: ${location.toJson()}');
  }

// This function is to be called when a location services status change occurs
// since the service was started.
  void _onLocationServicesStatusChanged(bool status) {
    log('isLocationServicesEnabled: $status');
  }

// This function is used to handle errors that occur in the service.
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      log('Undefined error: $error');
      return;
    }

    log('ErrorCode: $errorCode');
  }
}
