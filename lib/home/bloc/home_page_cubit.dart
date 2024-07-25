import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';
import 'package:mobile_attendance_test/home/bloc/home_page_state.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';
import 'package:mobile_attendance_test/utils/location_helper.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageState()) {
    checkIsMasterLocationSet();
  }

  GoogleMapController? mapController;
  final appSettingBox = LocalStorageHelper.getBox(LocalConstants.appSettingBox);

  Future<void> checkIsMasterLocationSet() async {
    final currentLocation = await LocationHelper().getCurrentLocation();
    final masterLocation = await LocationHelper().getMasterLocation();

    emit(
      state.copyWith(
        currentLocation: currentLocation,
        isMasterLocationSet: masterLocation != null,
      ),
    );
  }
}
