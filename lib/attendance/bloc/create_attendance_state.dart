import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

part 'create_attendance_state.freezed.dart';

@freezed
class CreateAttendanceState with _$CreateAttendanceState {
  const factory CreateAttendanceState({
    @Default(BaseStatus.initial) BaseStatus status,
    Uint8List? image,
    DateTime? attendanceAt,
    Placemark? address,
    LatLng? position,
  }) = _CreateAttendanceState;
}
