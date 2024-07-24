import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

part 'create_attendance_state.freezed.dart';

@freezed
class CreateAttendanceState with _$CreateAttendanceState {
  const factory CreateAttendanceState({
    @Default(BaseStatus.initial) BaseStatus status,
    XFile? image,
    @Default("") String title,
    DateTime? attendanceAt,
  }) = _CreateAttendanceState;
}
