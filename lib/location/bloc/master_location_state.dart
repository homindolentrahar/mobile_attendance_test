import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/model/marker_model.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

part 'master_location_state.freezed.dart';

@freezed
class MasterLocationState with _$MasterLocationState {
  factory MasterLocationState({
    @Default(BaseStatus.initial) BaseStatus status,
    LatLng? masterLocation,
    LatLng? currentLocation,
    Placemark? masterAddress,
    Placemark? currentAddress,
    @Default([]) List<MarkerModel> markers,
  }) = _MasterLocationState;
}
