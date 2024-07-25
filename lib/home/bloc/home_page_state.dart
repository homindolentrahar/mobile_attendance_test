import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/attendance/model/attendance_model.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(BaseStatus.initial) BaseStatus status,
    LatLng? currentLocation,
    @Default([]) List<AttendanceModel> attendances,
  }) = _HomePageState;
}
