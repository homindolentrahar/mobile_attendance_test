import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/location/bloc/master_location_state.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';
import 'package:mobile_attendance_test/utils/location_helper.dart';

class MasterLocationCubit extends Cubit<MasterLocationState> {
  MasterLocationCubit() : super(MasterLocationState()) {
    refreshData();
  }

  GoogleMapController? mapController;
  final appSettingBox = LocalStorageHelper.getBox(LocalConstants.appSettingBox);

  Future<void> refreshData() async {
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

    if (currentLocation == null) {
      emit(
        state.copyWith(
          status: BaseStatus.error,
        ),
      );

      return;
    }

    final currentAddress = await LocationHelper().getAddressFromPosition(
      currentLocation,
    );
    final masterAddress = await LocationHelper().getAddressFromPosition(
      masterLocation,
    );

    emit(
      state.copyWith(
        status: BaseStatus.success,
        currentLocation: currentLocation,
        currentAddress: currentAddress.firstOrNull,
        masterLocation: masterLocation,
        masterAddress: masterAddress.firstOrNull,
      ),
    );
  }
}
