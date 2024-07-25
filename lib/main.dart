import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_cubit.dart';
import 'package:mobile_attendance_test/home/home_page.dart';
import 'package:mobile_attendance_test/model/geofence_data_model.dart';
import 'package:mobile_attendance_test/utils/geofence_helper.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';
import 'package:mobile_attendance_test/utils/location_helper.dart';

void main() async {
  await LocalStorageHelper.init();

  await LocationHelper().checkAndEnableAllPermission();
  final savedMasterLocation = await LocationHelper().getMasterLocation();

  if (savedMasterLocation != null) {
    await GeofenceHelper().startGeofencingService();

    GeofenceHelper().addGeofence(
      GeofenceDataModel(
        id: AppConstants.masterGeofenceArea,
        latitude: savedMasterLocation.latitude,
        longitude: savedMasterLocation.longitude,
        radius: [
          GeofenceDataRadiusModel(
            id: AppConstants.masterGeofenceArea,
            radius: 50,
          ),
        ],
      ),
    );
  }

  runApp(const AttendanceTest());
}

class AttendanceTest extends StatelessWidget {
  const AttendanceTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapViewerCubit>(
      lazy: false,
      create: (_) => MapViewerCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance Test',
        home: HomePage.getPage(),
      ),
    );
  }
}
