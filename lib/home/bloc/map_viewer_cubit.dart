import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_state.dart';
import 'package:mobile_attendance_test/model/geofence_data_model.dart';
import 'package:mobile_attendance_test/model/marker_model.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/geofence_helper.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';

class MapViewerCubit extends Cubit<MapViewerState> {
  MapViewerCubit() : super(MapViewerState()) {
    refreshData();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Location.instance.onLocationChanged.listen(
        (position) {
          log("Stream Position: ${position.latitude}, ${position.longitude}");

          setMarkerOnTap(
            AppConstants.currentLocation,
            LatLng(
              position.latitude ?? 0,
              position.longitude ?? 0,
            ),
          );

          getPolyRoutes(
            position.latitude ?? 0,
            position.longitude ?? 0,
          );
        },
      );
    });
  }

  GoogleMapController? mapController;
  final appSettingBox = LocalStorageHelper.getBox(LocalConstants.appSettingBox);

  Future<void> refreshData() async {
    await setInitialLocation();
  }

  Future<void> getPolyRoutes(double lat, double long) async {
    final polylinesPoints = PolylinePoints();

    log("Polyline Points: ${state.masterLocation?.latitude}, ${state.masterLocation?.longitude}");

    final result = await polylinesPoints.getRouteBetweenCoordinates(
      "Your API Key",
      PointLatLng(lat, long),
      PointLatLng(
        state.masterLocation?.latitude ?? 0,
        state.masterLocation?.longitude ?? 0,
      ),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      emit(
        state.copyWith(
          polylineCoordinates: result.points
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList(),
        ),
      );
    }
  }

  Future<void> setInitialLocation() async {
    emit(state.copyWith(status: BaseStatus.loading));

    // final currentLocation = await LocationHelper().getCurrentLocation();
    final savedMasterLocation =
        await appSettingBox.get(LocalConstants.masterLocationKey);
    LatLng? masterLocation;

    if (savedMasterLocation != null) {
      masterLocation = LatLng(
        savedMasterLocation['latitude'] ?? 0,
        savedMasterLocation['longitude'] ?? 0,
      );
    }

    log("Master Location: ${masterLocation?.latitude}, ${masterLocation?.longitude}");

    // if (currentLocation == null) {
    //   emit(
    //     state.copyWith(
    //       status: BaseStatus.error,
    //     ),
    //   );

    //   return;
    // }

    emit(
      state.copyWith(
        status: BaseStatus.success,
        // currentLocation: currentLocation,
        masterLocation: masterLocation,
        markers: [
          // MarkerModel(
          //   markerId: AppConstants.currentLocation,
          //   position: currentLocation,
          // ),
          if (masterLocation != null)
            MarkerModel(
              markerId: AppConstants.masterLocation,
              position: masterLocation,
            ),
        ],
      ),
    );
  }

  Future<void> setMarkerOnTap(String id, LatLng? position) async {
    final savedMarkers = List<MarkerModel>.from(state.markers);

    if (savedMarkers.any((element) => element.markerId == id)) {
      savedMarkers.removeWhere((element) => element.markerId == id);
    }

    savedMarkers.add(
      MarkerModel(
        markerId: id,
        position: position ?? const LatLng(0.0, 0.0),
      ),
    );

    emit(
      state.copyWith(
        markers: savedMarkers,
      ),
    );
  }

  Future<void> saveMasterLocation(LatLng? position) async {
    await appSettingBox.put(
      LocalConstants.masterLocationKey,
      {'latitude': position?.latitude, 'longitude': position?.longitude},
    );

    // if (GeofenceHelper().isRunning()) {
    //   await GeofenceHelper().stopGeofencingService();
    // }

    GeofenceHelper().pasue();
    GeofenceHelper().removeGeofence(AppConstants.masterGeofenceArea);
    GeofenceHelper().addGeofence(
      GeofenceDataModel(
        id: AppConstants.masterGeofenceArea,
        latitude: position?.latitude ?? 0,
        longitude: position?.longitude ?? 0,
        radius: [
          GeofenceDataRadiusModel(
            id: AppConstants.masterGeofenceArea,
            radius: 50,
          ),
        ],
      ),
    );
    GeofenceHelper().resume();
    // await GeofenceHelper().startGeofencingService();

    emit(
      state.copyWith(
        masterLocation: LatLng(
          position?.latitude ?? 0,
          position?.longitude ?? 0,
        ),
      ),
    );
  }

  bool checkIsMasterLocationSame(LatLng? position) {
    final savedMasterLocation =
        appSettingBox.get(LocalConstants.masterLocationKey);
    LatLng? masterLocation;

    if (savedMasterLocation != null) {
      masterLocation = LatLng(
        savedMasterLocation['latitude'] ?? 0,
        savedMasterLocation['longitude'] ?? 0,
      );
    }

    return masterLocation?.latitude == position?.latitude &&
        masterLocation?.longitude == position?.longitude;
  }
}
