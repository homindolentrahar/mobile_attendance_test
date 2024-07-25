import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/attendance/model/attendance_model.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/home/bloc/home_page_state.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';
import 'package:mobile_attendance_test/utils/map_helper.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState()) {
    getAttendanceList();
  }

  GoogleMapController? mapController;
  final appSettingBox = LocalStorageHelper.getBox(LocalConstants.appSettingBox);

  Future<void> getAttendanceList() async {
    emit(state.copyWith(status: BaseStatus.loading));

    final attendances = LocalStorageHelper.getBox(LocalConstants.attendancesBox)
        .values
        .toList();

    emit(
      state.copyWith(
        status: BaseStatus.success,
        attendances: attendances
            .map((e) => AttendanceModel.fromJson(convertDynamicMap(e)))
            .toList(),
      ),
    );
  }
}
