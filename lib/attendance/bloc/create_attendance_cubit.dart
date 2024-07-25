import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_state.dart';
import 'package:mobile_attendance_test/attendance/model/attendance_model.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/extensions/location_extensions.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';
import 'package:mobile_attendance_test/utils/location_helper.dart';
import 'package:uuid/uuid.dart';

class CreateAttendanceCubit extends Cubit<CreateAttendanceState> {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController descController = TextEditingController();

  CreateAttendanceCubit({
    AttendanceModel? data,
  }) : super(const CreateAttendanceState()) {
    populateInitialData(data);
  }

  void populateInitialData(AttendanceModel? data) {
    if (data != null) {
      descController.text = data.description ?? "";

      emit(
        state.copyWith(
          isEdit: true,
          status: BaseStatus.success,
          image: data.image,
          address: data.address,
          position: LatLng(data.latitude, data.longitude),
          attendanceAt: data.timestamp,
        ),
      );
    }
  }

  Future<void> getLocationTag(Uint8List? image) async {
    emit(state.copyWith(status: BaseStatus.loading));

    final position = await LocationHelper().getCurrentLocation();
    final addresses = await LocationHelper().getAddressFromPosition(position);

    emit(
      state.copyWith(
        status: BaseStatus.success,
        image: image,
        address: addresses.firstOrNull?.toReadableAddress(),
        position: position,
        attendanceAt: DateTime.now(),
      ),
    );
  }

  Future<void> createAttendance() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      emit(state.copyWith(status: BaseStatus.loading));

      final data = AttendanceModel(
        id: const Uuid().v4(),
        image: state.image ?? Uint8List.fromList([]),
        description: formKey.currentState?.value["desc"] ?? "",
        latitude: state.position?.latitude ?? 0,
        longitude: state.position?.longitude ?? 0,
        address: state.address ?? "-",
        timestamp: DateTime.now(),
      );

      try {
        await LocalStorageHelper.getBox(LocalConstants.attendancesBox).add(
          data.toJson(),
        );

        emit(
          state.copyWith(
            status: BaseStatus.created,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: BaseStatus.error,
          ),
        );
      }
    }
  }
}
