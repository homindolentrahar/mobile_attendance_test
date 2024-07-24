import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/location/bloc/master_location_state.dart';
import 'package:mobile_attendance_test/model/marker_model.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';
import 'package:mobile_attendance_test/utils/location_helper.dart';

class MasterLocationCubit extends Cubit<MasterLocationState> {
  MasterLocationCubit() : super(MasterLocationState()) {
    setInitialLocation();
  }

  GoogleMapController? mapController;
  final appSettingBox = LocalStorageHelper.getBox(LocalConstants.appSettingBox);

  Future<void> refreshData() async {
    await setInitialLocation();
  }

  Future<void> setInitialLocation() async {
    emit(state.copyWith(status: BaseStatus.loading));

    final currentLocation = await LocationHelper().getCurrentLocation();
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

    if (currentLocation == null) {
      emit(
        state.copyWith(
          status: BaseStatus.error,
        ),
      );

      return;
    }

    emit(
      state.copyWith(
        status: BaseStatus.success,
        currentLocation: currentLocation,
        masterLocation: masterLocation,
        markers: [
          MarkerModel(
            markerId: AppConstants.currentLocation,
            position: currentLocation,
          ),
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
    emit(
      state.copyWith(
        markers: [
          ...state.markers,
          MarkerModel(
            markerId: id,
            position: position ?? const LatLng(0.0, 0.0),
          ),
        ],
      ),
    );
  }

  Future<void> saveMasterLocation(LatLng? position) async {
    await appSettingBox.put(
      LocalConstants.masterLocationKey,
      {'latitude': position?.latitude, 'longitude': position?.longitude},
    );

    emit(
      state.copyWith(
        masterLocation: position,
        markers: [
          ...state.markers,
          MarkerModel(
            markerId: AppConstants.masterLocation,
            position: position ?? const LatLng(0.0, 0.0),
          ),
        ],
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

    log("Master Location: ${masterLocation?.latitude}, ${masterLocation?.longitude}");
    log("Marker Location: ${position?.latitude}, ${position?.longitude}");

    return masterLocation?.latitude == position?.latitude &&
        masterLocation?.longitude == position?.longitude;
  }
}
