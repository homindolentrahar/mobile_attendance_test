import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/model/marker_model.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

part 'map_viewer_state.freezed.dart';

@freezed
class MapViewerState with _$MapViewerState {
  factory MapViewerState({
    @Default(BaseStatus.initial) BaseStatus status,
    LatLng? masterLocation,
    LatLng? currentLocation,
    @Default([]) List<MarkerModel> markers,
    @Default([]) List<LatLng> polylineCoordinates,
  }) = _MapViewerState;
}
